require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:zipcode) }
  end

  describe "geocoding" do
    it "should geocode the address with only a zipcode", :vcr do
      user = User.create!(
        username: "Mr. Test",
        zipcode: "92315",
        email: "test@gmail.com",
        password_digest: "test123"
      )
      event = Event.create!(
        title: "Beach Trip",
        zipcode: "93109",
        user_id: user.id
      )

      event.valid?

      expect(event.latitude).to be_a(Float)
      expect(event.longitude).to be_a(Float)
    end

    it "should geocode the address with a street address and zipcode", :vcr do
      user = User.create!(
        username: "Mr. Test",
        zipcode: "92315",
        email: "test@gmail.com",
        password_digest: "test123"
      )
      event = Event.create!(
        title: "Beach Trip",
        street_address: "990 Summit Blvd",
        zipcode: "93109",
        user_id: user.id
      )

      event.valid?

      expect(event.latitude).to be_a(Float)
      expect(event.longitude).to be_a(Float)
    end

    it "should not geocode the address without a zipcode", :vcr do
      user = User.create!(
        username: "Mr. Test",
        zipcode: "92315",
        email: "test@gmail.com",
        password_digest: "test123"
      )
      expect { Event.create!(title: "Beach Trip", user_id: user.id) }.to raise_error(ActiveRecord::RecordInvalid)
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
            zipcode: "92315",
            email: "test@gmail.com",
            password_digest: "test123"
          )
          event = Event.create!(
            title: "Beach Trip",
            street_address: "990 Summit Blvd",
            zipcode: "93109",
            user_id: user.id
          )

          expect(event.send(:address)).to eq("990 Summit Blvd, 93109")
        end

        it "should return complete address from zipcode only", :vcr do
          user = User.create!(
            username: "Mr. Test",
            zipcode: "92315",
            email: "test@gmail.com",
            password_digest: "test123"
          )
          event = Event.create!(
            title: "Beach Trip",
            zipcode: "93109",
            user_id: user.id
          )

          expect(event.send(:address)).to eq("93109")
        end
      end
    end
  end
end
