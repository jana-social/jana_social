require "rails_helper"

RSpec.describe "Update Event API" do
  before :each do
    user_data
    event_data
    event_params
  end

  describe "Can update an event api" do
    it "can update an existing event api" do
      expect(Event.count).to eq(4)

      headers = { "CONTENT_TYPE" => "application/json" }
      patch "/api/v1/users/#{@user1.id}/events/#{@event1.id}", headers: headers, params: JSON.generate(@new_event)

      event = Event.first

      expect(event.title).to eq(@new_event[:title])
      expect(event.description).to eq(@new_event[:description])
      expect(event.street_address).to eq(@new_event[:street_address])
      expect(event.zipcode).to eq(@new_event[:zipcode])
      expect(event.date_time).to eq(@new_event[:date_time])
      expect(event.private_status).to eq(@new_event[:private_status])
      expect(event.user_id).to eq(@new_event[:user_id])

      expect(Event.count).to eq(4)
    end
  end

  describe "sad path" do
    it "returns an error if the response is unprocessable", :vcr do
      event_params = {
        title: "",
        description: "Hoooosier",
        street_address: "",
        zipcode: "23423",
        date_time: "",
        private_status: false,
        user_id: nil
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/users/#{@user1.id}/events", headers: headers, params: JSON.generate(event_params)

      expect(response).to_not be_successful
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
