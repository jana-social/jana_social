require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }

    before(:each) do
      validation_data
    end

    it { should allow_value("80203").for(:zipcode) }
    it { should allow_value("80203-0121").for(:zipcode) }
    it { should_not allow_value("8020").for(:zipcode) }
    it { should_not allow_value("ABC12").for(:zipcode) }
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
      expect do
        User.create!(
          username: "Mrs. Test",
          zipcode: nil,
          street_address: "505 E Colfax Ave",
          email: "foo@gmail.com",
          password: "test123"
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not geocode the address with a four digit zipcode" do
      validation_data

      expect do
        User.create!(
          username: "Mrs. Test",
          zipcode: "8020",
          street_address: nil,
          email: "foo@gmail.com",
          password: "test123"
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not geocode the address with letters in the zipcode" do
      validation_data

      expect do
        User.create!(
          username: "Mrs. Test",
          zipcode: "ABC12",
          street_address: nil,
          email: "foo@gmail.com",
          password: "test123"
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not geocode the address with an invalid street address" do
      validation_data

      expect do
        User.create!(
          username: "Mrs. Test",
          zipcode: "32492",
          street_address: "324 Blickford Drive",
          email: "foo@gmail.com",
          password: "test123"
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "instance methods" do
    before(:each) do
      user_data
    end

    context "public methods" do
      describe "instance method to find friends within a distance radius" do
        it "#find_friends_within_distance" do
         current_user = @user1
          expect(current_user.find_friends_within_distance(50)).to eq([@user1, @user2])
          expect(current_user.find_friends_within_distance(50)).not_to include([@user3, @user4])
        end

        it "#find_friends_within_distance" do
          current_user = @user1
          expect(current_user.find_friends_within_distance(5)).to eq([@user1])
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
