require "rails_helper"

RSpec.describe "GET Event Users" do
  describe "Event Users Index JSON response" do
    before :each do
      user_data
      event_data
    end

    it "returns a list of event-specific event_users and respecitve attributes in JSON:API compliance" do
      event_user_1 = EventUser.create!(user_id: @user2.id, event_id: @event1.id, status: 2)
      event_user_2 = EventUser.create!(user_id: @user3.id, event_id: @event1.id, status: 2)

      get "/api/v1/events/#{@event1.id}/event_users"

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
