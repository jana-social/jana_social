require "rails_helper"

RSpec.describe "Find Events API", type: :request do
  before :each do
    user_data
    event_data
  end

  describe "GET /api/v1/users/:id/find_events" do
    describe "happy path" do
      it "returns events for a user based on search radius" do
        get "/api/v1/users/#{@user4.id}/find_events?distance=250"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        events = JSON.parse(response.body, symbolize_names: true)

        expect(events[:data].count).to eq(2)

        events[:data].each do |event|
          expect(event).to have_key(:id)
          expect(event).to have_key(:type)
          expect(event).to have_key(:attributes)
          expect(event[:attributes]).to have_key(:title)
          expect(event[:attributes]).to have_key(:description)
          expect(event[:attributes]).to have_key(:street_address)
          expect(event[:attributes]).to have_key(:zipcode)
          expect(event[:attributes]).to have_key(:date_time)
          expect(event[:attributes]).to have_key(:private_status)
        end
      end
    end

    describe "sad path" do
      it "returns an error if no search radius is provided" do
        get "/api/v1/users/#{@user1}/find_events"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end

      it "returns an error if search radius is 0" do
        get "/api/v1/users/#{@user1}/find_events?distance=0"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end

      it "returns an error if search radius is negative" do
        get "/api/v1/users/#{@user1}/find_events?distance=-50"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end

      it "returns an error if search radius is not a number" do
        get "/api/v1/users/#{@user1}/find_events?distance=abc"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end
    end
  end
end
