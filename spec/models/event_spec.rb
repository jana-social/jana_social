require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
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

    it "should not geocode the address with a four digit zipcode" do
      validation_data

      expect do
        Event.create!(
          title: "Drive-In Movie",
          street_address: nil,
          description: "Lorem Ipsum",
          zipcode: "8020",
          date_time: "2023-10-5 4:30:00",
          private_status: false,
          user_id: @user1.id
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not geocode the address with letters in the zipcode" do
      validation_data

      expect do
        Event.create!(
          title: "Drive-In Movie",
          street_address: nil,
          description: "Lorem Ipsum",
          zipcode: "ABC12",
          date_time: "2023-10-5 4:30:00",
          private_status: false,
          user_id: @user1.id
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not geocode the address with an invalid street address" do
      validation_data

      expect do
        Event.create!(
          title: "Drive-In Movie",
          street_address: "324 Blickford Drive",
          description: "Lorem Ipsum",
          zipcode: "32492",
          date_time: "2023-10-5 4:30:00",
          private_status: false,
          user_id: @user1.id
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "instance methods" do
    before(:each) do
      user_data
      event_data
    end

    # context "public methods" do
    #   pending "add some examples to (or delete) #{__FILE__}"
    # end

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
