require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:zipcode) }
  end

  describe "relationships" do
    it { should have_many(:event_users) }
    it { should have_many(:events).through(:event_users) }
    it { should have_many(:friendships).dependent(:destroy) }
    it { should have_many(:friends).through(:friendships) }
  end

  describe "geocoding" do
    it "should geocode the address with only a zipcode", :vcr do
      user = User.create!(
        username: "Mr. Test",
        zipcode: "92315",
        email: "test@gmail.com",
        password_digest: "test123"
      )

      user.valid?

      expect(user.latitude).to be_a(Float)
      expect(user.longitude).to be_a(Float)
    end

    it "should geocode the address with a street address and zipcode", :vcr do
      user = User.create!(
        username: "Mr. Test",
        street_address: "990 Summit Blvd",
        zipcode: "92315",
        email: "test@gmail.com",
        password_digest: "test123"
      )

      user.valid?

      expect(user.latitude).to be_a(Float)
      expect(user.longitude).to be_a(Float)
    end

    it "should not geocode the address without a zipcode", :vcr do
      expect { User.create!(username: "Mr. Test") }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "instance methods" do
    context "public methods" do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    context "private methods" do
      describe "#address" do
        it "should return complete address from street address and zipcode", :vcr do
          user = User.create!(
            username: "Mr. Test",
            street_address: "990 Summit Blvd",
            zipcode: "92315",
            email: "test@gmail.com",
            password_digest: "test123"
          )

          expect(user.send(:address)).to eq("990 Summit Blvd, 92315")
        end

        it "should return complete address from zipcode only", :vcr do
          user = User.create!(
            username: "Mr. Test",
            zipcode: "92315",
            email: "test@gmail.com",
            password_digest: "test123"
          )

          expect(user.send(:address)).to eq("92315")
        end
      end
    end
  end
end
