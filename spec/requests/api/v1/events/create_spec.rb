require "rails_helper"

RSpec.describe "Create Event API" do
  let!(:user_1) { create(:user, username: "boom", street_address: "990 Summit Blvd.", zipcode: "92315") }
  describe "Can create a new event api" do
    it "can create a new event api", :vcr do

      expect(Event.count).to eq(0)

      event_params = ({
        title: "Event 20",
        description: "Lorem Ipsum",
        street_address: "123 Mulberry Lane, Shreveport, LA",
        zipcode: "32095",
        date_time: "2023-10-5 4:30:00",
        private_status: false,
        user_id: user_1.id
      })

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users/#{user_1.id}/events", headers: headers, params: JSON.generate(event_params)

      event = Event.last

      expect(event.title).to eq(event_params[:title])
      expect(event.description).to eq(event_params[:description])
      expect(event.street_address).to eq(event_params[:street_address])
      expect(event.zipcode).to eq(event_params[:zipcode])
      expect(event.date_time).to eq(event_params[:date_time])
      expect(event.private_status).to eq(event_params[:private_status])
      expect(event.user_id).to eq(event_params[:user_id])
    end
  end
end
