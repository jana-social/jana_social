require "rails_helper"

RSpec.describe "Events Index API" do
  describe "Events index JSON response" do
    before :each do
      user_data
      event_data
    end

    it "returns a list of events and respective attributes in JSON:API compliance" do
      get api_v1_events_path

      events = JSON.parse(response.body, symbolize_names: true)

      expect(events[:data].count).to eq(4)

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
