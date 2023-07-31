require "rails_helper"

RSpec.describe "Events Show API" do
  describe "Events index JSON response" do
    before :each do
      user_data
      event_data
    end

    it "returns one event object and respective attributes in JSON:API compliance" do
      get api_v1_event_path(@event1)

      event = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(event[:data][:id]).to eq(@event1.id.to_s)
      expect(event[:data][:attributes][:title]).to eq(@event1.title.to_s)
      expect(event[:data][:attributes][:description]).to eq(@event1.description.to_s)
      expect(event[:data][:attributes][:street_address]).to eq(@event1.street_address.to_s)
      expect(event[:data][:attributes][:date_time]).to eq(@event1.date_time.strftime("%Y-%m-%d %H:%M:%S"))
      expect(event[:data][:attributes][:private_status]).to eq(@event1.private_status)
      expect(event[:data][:attributes][:zipcode]).to eq(@event1.zipcode.to_s)
      expect(event[:data][:attributes][:user_id]).to eq(@user1.id)
      expect(event[:data][:attributes][:host]).to eq(@user1.username)
    end
  end
end
