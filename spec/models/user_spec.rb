require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:zipcode) }
  end

  describe "relationships" do
    it { should have_many(:event_users) }
    it { should have_many(:events).through(:event_users) }
    it { should have_many(:friendships).dependent(:destroy) }
    it { should have_many(:friends).through(:friendships) }
  end

  describe "geocoding" do
    before(:each) do
      user_data
    end

    it "should geocode the address with a street address and zipcode" do
      @user3.valid?

      expect(@user3.latitude).to be_a(Float)
      expect(@user3.longitude).to be_a(Float)
    end
    it "should geocode the address with only a zipcode" do
      @user4.valid?

      expect(@user4.latitude).to be_a(Float)
      expect(@user4.longitude).to be_a(Float)
    end

    it "should not geocode the address without a zipcode" do
      expect { User.create!(username: "Mrs. Test") }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "instance methods" do
    before(:each) do
      user_data
    end

    context "public methods" do
      describe "#nearby_users" do
        it "should return friends within a distance radius" do
          expect(@user1.nearby_users(50)).to eq([@user1, @user2])
          expect(@user1.nearby_users(50)).not_to include([@user3, @user4])
          expect(@user1.nearby_users(5)).to eq([@user1])
        end
      end

      describe "#pending_friends" do
        it "should return all users with a pending friendship where the user was not the initiator of the friendship" do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(@user1.pending_friends).to eq([])
          expect(@user2.pending_friends).to eq([@user1])

          Friendship.process_friendship(@user2, @user1, :approved)
          expect(@user1.pending_friends).to eq([])
          expect(@user2.pending_friends).to eq([])

          Friendship.process_friendship(@user1, @user3, :declined)
          expect(@user1.pending_friends).to eq([])
          expect(@user3.pending_friends).to eq([])

          Friendship.process_friendship(@user1, @user4, :approved)
          expect(@user4.pending_friends).to eq([@user1])
          Friendship.process_friendship(@user4, @user1, :approved)
          expect(@user4.pending_friends).to eq([])
        end
      end

      describe "#approved_friends" do
        it "should return all unique users that the current user has an approved friendship with" do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(@user1.approved_friends).to eq([])
          expect(@user2.approved_friends).to eq([])

          Friendship.process_friendship(@user2, @user1, :approved)
          expect(@user1.approved_friends).to eq([@user2])
          expect(@user2.approved_friends).to eq([@user1])

          Friendship.process_friendship(@user1, @user3, :declined)
          expect(@user1.approved_friends).to eq([@user2])
          expect(@user3.approved_friends).to eq([])

          Friendship.process_friendship(@user1, @user4, :approved)
          expect(@user1.approved_friends).to eq([@user2])
          expect(@user4.approved_friends).to eq([])

          Friendship.process_friendship(@user4, @user1, :approved)
          expect(@user1.approved_friends).to eq([@user2, @user4])
          expect(@user4.approved_friends).to eq([@user1])
        end
      end

      describe "#declined_friends" do
        it "should return all users that the current user has a declined friendship with" do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(@user1.declined_friends).to eq([])
          expect(@user2.declined_friends).to eq([])

          Friendship.process_friendship(@user2, @user1, :approved)
          expect(@user1.declined_friends).to eq([])
          expect(@user2.declined_friends).to eq([])

          Friendship.process_friendship(@user1, @user3, :declined)
          expect(@user1.declined_friends).to eq([@user3])
          expect(@user3.declined_friends).to eq([@user1])

          Friendship.process_friendship(@user1, @user4, :approved)
          expect(@user1.declined_friends).to eq([@user3])
          expect(@user4.declined_friends).to eq([])

          Friendship.process_friendship(@user4, @user1, :declined)
          expect(@user1.declined_friends).to eq([@user3, @user4])
          expect(@user4.declined_friends).to eq([@user1])

          Friendship.process_friendship(@user3, @user4, :declined)
          expect(@user3.declined_friends).to eq([@user4, @user1])
          expect(@user4.declined_friends).to eq([@user1, @user3])
        end
      end

      describe "#potential_friends" do
        it "should return all users that the current user could approve/deny for friendship" do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(@user1.potential_friends).to eq([@user3, @user4])
          expect(@user2.potential_friends).to eq([@user1, @user3, @user4])

          Friendship.process_friendship(@user2, @user1, :approved)
          expect(@user1.potential_friends).to eq([@user3, @user4])
          expect(@user2.potential_friends).to eq([@user3, @user4])

          Friendship.process_friendship(@user1, @user3, :declined)
          expect(@user1.potential_friends).to eq([@user4])
          expect(@user3.potential_friends).to eq([@user2, @user4])

          Friendship.process_friendship(@user1, @user4, :approved)
          expect(@user1.potential_friends).to eq([])
          expect(@user4.potential_friends).to eq([@user1, @user2, @user3])

          Friendship.process_friendship(@user4, @user1, :declined)
          expect(@user1.potential_friends).to eq([])
          expect(@user4.potential_friends).to eq([@user2, @user3])

          Friendship.process_friendship(@user3, @user4, :declined)
          expect(@user3.potential_friends).to eq([@user2])
          expect(@user4.potential_friends).to eq([@user2])
        end
      end

      describe "#potential_friends_nearby" do
        it "should return all users that could be approved/denied for friendship within a distance radius" do
          expect(@user1.potential_friends_nearby(50)).to eq([@user2])
          expect(@user2.potential_friends_nearby(50)).to eq([@user1])
          expect(@user3.potential_friends_nearby(50)).to eq([])
          expect(@user4.potential_friends_nearby(50)).to eq([])

          Friendship.process_friendship(@user1, @user2, :approved)

          expect(@user1.potential_friends_nearby(50)).to eq([])
          expect(@user2.potential_friends_nearby(50)).to eq([@user1])
          expect(@user3.potential_friends_nearby(50)).to eq([])
          expect(@user4.potential_friends_nearby(50)).to eq([])

          Friendship.process_friendship(@user2, @user1, :approved)

          expect(@user1.potential_friends_nearby(50)).to eq([])
          expect(@user2.potential_friends_nearby(50)).to eq([])
          expect(@user3.potential_friends_nearby(50)).to eq([])
          expect(@user4.potential_friends_nearby(50)).to eq([])

          Friendship.process_friendship(@user1, @user3, :approved)

          expect(@user1.potential_friends_nearby(50)).to eq([])
          expect(@user2.potential_friends_nearby(50)).to eq([])
          expect(@user3.potential_friends_nearby(50)).to eq([])
          expect(@user4.potential_friends_nearby(50)).to eq([])

          Friendship.process_friendship(@user3, @user4, :approved)

          expect(@user4.potential_friends_nearby(250)).to eq([@user3])
        end
      end
    end

    context "private methods" do
      describe "#address" do
        it "should return complete address from street address and zipcode" do
          expect(@user3.send(:address)).to eq("990 Summit Blvd, 92315, United States")
        end

        it "should return complete address from zipcode only" do
          expect(@user4.send(:address)).to eq("90210, United States")
        end
      end
    end
  end
end
