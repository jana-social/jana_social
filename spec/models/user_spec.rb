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
      event_data
    end

    context "public methods" do
      describe "::find_friends_within_distance" do
        it "instance method to find friends within a distance radius" do
          current_user = @user1
          expect(current_user.find_friends_within_distance(50)).to eq([@user1, @user2])
          expect(current_user.find_friends_within_distance(50)).not_to include([@user3, @user4])
        end

        it "returns only the current user when no others are within the distance range" do
          current_user = @user1
          expect(current_user.find_friends_within_distance(5)).to eq([@user1])
        end
      end

      describe "::find_events_within_distance" do
        it "instance method to find events within a distance radius" do
          current_user = @user1
          expect(current_user.find_events_within_distance(10)).to eq([@event3])
          expect(current_user.find_events_within_distance(250)).to eq([@event3, @event2])
          expect(current_user.find_events_within_distance(2)).to eq([])
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
