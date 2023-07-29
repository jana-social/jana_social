require "rails_helper"

RSpec.describe "Events Index API" do
  describe "Events index JSON response" do
    let!(:user_1) { create(:user, username: "Joey", street_address: "990 Summit Blvd.", zipcode: "92315") }
    let!(:user_2) { create(:user, username: "Andrew", street_address: "1234 Main St.", zipcode: "93109") }
    let!(:user_3) { create(:user, username: "Rickford", street_address: "5678 Broadway", zipcode: "90210") }
    let!(:event_1) { create(:event, street_address: "3456 State St.", zipcode: "93109", user_id: user_1.id) }
    let!(:event_2) { create(:event, street_address: "7890 Hollister Ave.", zipcode: "93117", user_id: user_1.id) }
    let!(:event_3) { create(:event, street_address: "9012 Cathedral Oaks Rd.", zipcode: "93117", user_id: user_2.id) }

    it "returns a list of events and respective attributes in JSON:API compliance", :vcr do
      get api_v1_events_path

      events = JSON.parse(response.body, symbolize_names: true)

      expect(events[:data].count).to eq(3)

      expect(response).to be_successful
      events[:data].each do |event|
        expect(event).to have_key(:id)
        expect(event[:id]).to be_a(String)

        expect(event[:attributes]).to have_key(:title)
        expect(event[:attributes]).to have_key(:description)
        expect(event[:attributes]).to have_key(:street_address)
        expect(event[:attributes]).to have_key(:date_time)
        expect(event[:attributes]).to have_key(:private_status)
        expect(event[:attributes]).to have_key(:zipcode)
      end
    end
  end
end
