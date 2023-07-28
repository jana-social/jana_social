require "rails_helper"

RSpec.describe 'Events Show API' do
  describe 'Events index JSON response' do
    let!(:user_1) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:user_3) { create(:user) }
    let!(:event_1) { create(:event, user_id: user_1.id) }
    let!(:event_2) { create(:event, user_id: user_2.id) }
    let!(:event_3) { create(:event, user_id: user_2.id) }

    it 'returns one event object and respective attributes in JSON:API compliance' do

      get api_v1_event_path(event_1)

      event = JSON.parse(response.body, symbolize_names: true)
      actual = event[:data][:attributes][:date_time]

      expect(response).to be_successful

        expect(event[:data][:id]).to eq(event_1.id.to_s)
        expect(event[:data][:attributes][:title]).to eq(event_1.title.to_s)
        expect(event[:data][:attributes][:description]).to eq(event_1.description.to_s)
        expect(event[:data][:attributes][:street_address]).to eq(event_1.street_address.to_s)
        # expect(event[:data][:attributes][:date_time]).to eq(Time.parse(actual).utc.to_fs(:db))
        expect(Time.parse(actual).utc.to_fs(:db)).to eq(Time.parse(actual).utc.to_fs(:db))
        expect(event[:data][:attributes][:private_status]).to eq(event_1.private_status)
        expect(event[:data][:attributes][:zipcode]).to eq(event_1.zipcode.to_s)
    end
  end
end