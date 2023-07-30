require "rails_helper"

RSpec.describe "Hosting Response", type: :request do
  before :each do
    user_data
    event_data
  end

  describe "My Events JSON response" do
    it "returns a list of user specific hosted events and respective attributes in JSON:API compliance " do
      event_user_1 = EventUser.create!(user_id: @user1.id, event_id: @event3.id, status: 2)
      event_user_2 = EventUser.create!(user_id: @user1.id, event_id: @event2.id, status: 2)
      event_user_3 = EventUser.create!(user_id: @user2.id, event_id: @event1.id, status: 2)

      get "/api/v1/users/#{@user2.id}/events/hosting"

      hosting = JSON.parse(response.body, symbolize_names: true)

      expect(hosting[:data].count).to eq(2)

      hosting[:data].each do |event|
        expect(event).to have_key(:id)
        expect(event).to have_key(:type)
        expect(event).to have_key(:attributes)
        expect(event[:attributes]).to have_key(:title)
        expect(event[:attributes]).to have_key(:description)
        expect(event[:attributes]).to have_key(:street_address)
        expect(event[:attributes]).to have_key(:private_status)
        expect(event[:attributes]).to have_key(:zipcode)
        expect(event[:attributes]).to have_key(:user_id)
        expect(event[:attributes]).to have_key(:date_time)
        expect(event[:attributes]).to have_key(:host)

        expect(event[:attributes][:title]).to be_a(String)
        expect(event[:attributes][:description]).to be_a(String)
        expect(event[:attributes][:street_address]).to be_a(String)
        expect(event[:attributes][:private_status]).to be_in([true, false])
        expect(event[:attributes][:zipcode]).to be_a(String)
        expect(event[:attributes][:user_id]).to be_an(Integer)
        expect(event[:attributes][:date_time]).to be_an(String)
        expect(event[:attributes][:host]).to be_an(String)

        expect(event[:attributes][:title]).to_not eq(@event1.title)
      end
    end
  end
end
