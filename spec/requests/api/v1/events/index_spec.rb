require 'rails_helper'

RSpec.describe 'Events Index API' do 
  describe 'Events index JSON response' do 
    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:user_3) { create(:user) }
    let!(:event_1) { create(:event, user_id: user_1.id) }
    let!(:event_2) { create(:event, user_id: user_2.id) }
    let!(:event_3) { create(:event, user_id: user_2.id) }
    it 'returns an event and its attributes in JSON:API compliance' do 

      get api_v1_events_path

      events = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      events[:data].each do |event|
        expect(event).to have_key(:id)
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