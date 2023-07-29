require "rails_helper"

RSpec.describe "delete Event API" do
  let!(:user_1) { create(:user, username: "Jason Brandon", street_address: "990 Summit Blvd.", zipcode: "92315") }
  let!(:event_1) { create(:event, street_address: "3456 State St.", zipcode: "93109", user_id: user_1.id) }
  let!(:event_2) { create(:event, street_address: "3456 State St.", zipcode: "93109", user_id: user_1.id) }

  describe "Can delete an event api" do
    it "can delete an existing event api", :vcr do
      EventUser.create!(event_id: event_1.id, user_id: user_1.id)
      EventUser.create!(event_id: event_2.id, user_id: user_1.id)
      expect(EventUser.count).to eq(2)
      expect(Event.count).to eq(2)

      delete "/api/v1/users/#{user_1.id}/events/#{event_1.id}"

      expect(Event.count).to eq(1)
      expect(EventUser.count).to eq(1)
    end
  end
end