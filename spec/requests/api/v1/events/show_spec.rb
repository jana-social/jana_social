require "rails_helper"

RSpec.describe "Events Show API" do
  describe "Events index JSON response" do
    let!(:user_1) { create(:user, username: "Mr. Test", zipcode: "92315") }
    let!(:user_2) { create(:user, username: "Mrs. Test", zipcode: "92314") }
    let!(:user_3) { create(:user, username: "Billy Bob Testerburger", zipcode: "73505") }
    let!(:event_1) { create(:event, user_id: user_1.id) }
    let!(:event_2) { create(:event, user_id: user_2.id) }
    let!(:event_3) { create(:event, user_id: user_2.id) }

    it "returns one event object and respective attributes in JSON:API compliance", vcr: { match_requests_on: [:method, :host, :path] } do
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
