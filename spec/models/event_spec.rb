require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:zipcode) }
  end

  describe "relationships" do
    it { should have_many(:event_users) }
    it { should have_many(:users).through(:event_users) }
  end

  describe "geocoding" do
    before(:each) do
      user_data
      event_data
    end

    it "should geocode the address with a street address and zipcode" do
      @event1.valid?

      expect(@event1.latitude).to be_a(Float)
      expect(@event1.longitude).to be_a(Float)
    end

    it "should geocode the address with only a zipcode" do
      @event4.valid?

      expect(@event4.latitude).to be_a(Float)
      expect(@event4.longitude).to be_a(Float)
    end

    it "should not geocode the address without a zipcode" do
      expect { Event.create!(title: "Beach Trip", user_id: @user3.id) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "instance methods" do
    before(:each) do
      user_data
      event_data
    end

    context "public methods" do
      pending "add some examples to (or delete) #{__FILE__}"
      describe "#find_events_within_distance" do
        it "instance method to find events within a distance radius" do
          require 'pry'; binding.pry

         current_user = @user1
          expect(current_user.find_events_within_distance(50)).to eq([@user1])
          expect(current_user.find_events_within_distance(50)).not_to include([@user2, @user3, @user4])
          expect(current_user.find_events_within_distance(200)).to eq([@user1])

        end
      end
    end

    context "private methods" do
      describe "#address" do
        it "should return complete address from street address and zipcode" do
          expect(@event1.send(:address)).to eq("990 Summit Blvd, 92315, United States")
        end

        it "should return complete address from zipcode only" do
          expect(@event4.send(:address)).to eq("93109, United States")
        end
      end
    end
  end
end
