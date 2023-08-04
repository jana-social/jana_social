require "rails_helper"

RSpec.describe "User/events show", type: :request do
  before :each do
    user_data
    event_data
  end

  describe "My Events JSON response" do
    it "returns a list of user specific hosted events and respective attributes in JSON:API compliance " do
      event_user_1 = EventUser.create!(user_id: @user1.id, event_id: @event3.id, status: 2)
      event_user_2 = EventUser.create!(user_id: @user1.id, event_id: @event2.id, status: 2)
      event_user_3 = EventUser.create!(user_id: @user2.id, event_id: @event1.id, status: 2)

      get "/api/v1/users/#{@user2.id}/events/#{@event1.id}"

      event = JSON.parse(response.body, symbolize_names: true)

      expect(event[:data]).to have_key(:id)
      expect(event[:data]).to have_key(:type)
      expect(event[:data]).to have_key(:attributes)
      expect(event[:data][:attributes]).to have_key(:title)
      expect(event[:data][:attributes]).to have_key(:description)
      expect(event[:data][:attributes]).to have_key(:street_address)
      expect(event[:data][:attributes]).to have_key(:private_status)
      expect(event[:data][:attributes]).to have_key(:zipcode)
      expect(event[:data][:attributes]).to have_key(:user_id)
      expect(event[:data][:attributes]).to have_key(:date_time)
      expect(event[:data][:attributes]).to have_key(:host)

      expect(event[:data][:attributes][:title]).to be_a(String)
      expect(event[:data][:attributes][:description]).to be_a(String)
      expect(event[:data][:attributes][:street_address]).to be_a(String)
      expect(event[:data][:attributes][:private_status]).to be_in([true, false])
      expect(event[:data][:attributes][:zipcode]).to be_a(String)
      expect(event[:data][:attributes][:user_id]).to be_an(Integer)
      expect(event[:data][:attributes][:date_time]).to be_an(String)
      expect(event[:data][:attributes][:host]).to be_an(String)

    end
  end
end