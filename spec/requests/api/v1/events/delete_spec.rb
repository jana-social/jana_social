require "rails_helper"

RSpec.describe "delete Event API" do
  before :each do
    user_data
    event_data
  end

  describe "Can delete an event api" do
    it "can delete an existing event api" do
      EventUser.create!(event_id: @event1.id, user_id: @user1.id)
      EventUser.create!(event_id: @event2.id, user_id: @user1.id)

      expect(EventUser.count).to eq(2)
      expect(Event.count).to eq(4)

      delete "/api/v1/users/#{@user1.id}/events/#{@event1.id}"

      expect(Event.count).to eq(3)
      expect(EventUser.count).to eq(1)
    end
  end
end
