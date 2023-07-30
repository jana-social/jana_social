require "rails_helper"

RSpec.describe "GET Event Users" do
  describe "Event Users Index JSON response" do

    let!(:user_1) { create(:user, username: "Joey", street_address: "990 Summit Blvd.", zipcode: "92315") }
    let!(:user_2) { create(:user, username: "Andrew", street_address: "1234 Main St.", zipcode: "93109") }
    let!(:user_3) { create(:user, username: "Rickford", street_address: "5678 Broadway", zipcode: "90210") }
    let!(:event_1) { create(:event, street_address: "3456 State St.", zipcode: "93109", user_id: user_1.id) }
    let!(:event_2) { create(:event, street_address: "7890 Hollister Ave.", zipcode: "93117", user_id: user_1.id) }
    let!(:event_3) { create(:event, street_address: "9012 Cathedral Oaks Rd.", zipcode: "93117", user_id: user_2.id) }


    it "returns a list of event-specific event_users and respecitve attributes in JSON:API compliance", :vcr do
      event_user_1 = EventUser.create!(user_id: user_2.id, event_id: event_1.id, status: 2)
      event_user_2 = EventUser.create!(user_id: user_3.id, event_id: event_1.id, status: 2)

      get "/api/v1/events/#{event_1.id}/event_users"

      attendees = JSON.parse(response.body, symbolize_names: true)

      attendees[:data].each do |attendee|
        expect(attendee).to have_key(:id)
        expect(attendee).to have_key(:type)
        expect(attendee).to have_key(:attributes)

        expect(attendee[:attributes]).to have_key(:event_title)
        expect(attendee[:attributes]).to have_key(:username)

        expect(attendee[:attributes][:event_title]).to be_a(String)
        expect(attendee[:attributes][:username]).to be_a(String)
      end
    end


  end
end