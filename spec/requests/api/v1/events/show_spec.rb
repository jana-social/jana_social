require "rails_helper"

RSpec.describe "Events Show API" do
  describe "Events index JSON response" do
    let!(:user_1) { create(:user, username: "jimmy smalls", street_address: "990 Summit Blvd.", zipcode: "92315") }
    let!(:user_2) { create(:user, username: "tipac", street_address: "1234 Main St.", zipcode: "93109") }
    let!(:user_3) { create(:user, username: "nos", street_address: "5678 Broadway", zipcode: "90210") }
    let!(:event_1) { create(:event, street_address: "3456 State St.", zipcode: "93109", user_id: user_1.id) }
    let!(:event_2) { create(:event, street_address: "7890 Hollister Ave.", zipcode: "93117", user_id: user_1.id) }
    let!(:event_3) { create(:event, street_address: "9012 Cathedral Oaks Rd.", zipcode: "93117", user_id: user_2.id) }

    it "returns one event object and respective attributes in JSON:API compliance", :vcr do
      get api_v1_event_path(event_1)

      event = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(event[:data][:id]).to eq(event_1.id.to_s)
      expect(event[:data][:attributes][:title]).to eq(event_1.title.to_s)
      expect(event[:data][:attributes][:description]).to eq(event_1.description.to_s)
      expect(event[:data][:attributes][:street_address]).to eq(event_1.street_address.to_s)
      expect(event[:data][:attributes][:date_time]).to eq(event_1.date_time.strftime("%Y-%m-%d %H:%M:%S"))
      expect(event[:data][:attributes][:private_status]).to eq(event_1.private_status)
      expect(event[:data][:attributes][:zipcode]).to eq(event_1.zipcode.to_s)
      expect(event[:data][:attributes][:user_id]).to eq(user_1.id)
      expect(event[:data][:attributes][:host]).to eq(user_1.username)
    end
  end
end
