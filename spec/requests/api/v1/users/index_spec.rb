require "rails_helper"

describe "Users index request" do
  let!(:user_1) { create(:user) }
  
  it "requests all the users", vcr: { match_requests_on: [:method, :host, :path] } do
    get api_v1_users_path
    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)

    users[:data].each do |user|
      expect(user).to have_key(:id)
      expect(user).to have_key(:type)
      expect(user).to have_key(:attributes)

      expect(user[:attributes]).to have_key(:username)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes]).to have_key(:password_digest)
      expect(user[:attributes]).to have_key(:zipcode)
      expect(user[:attributes]).to have_key(:street_address)
      expect(user[:attributes]).to have_key(:bio)
      expect(user[:attributes]).to have_key(:likes)
      expect(user[:attributes]).to have_key(:dislikes)
      expect(user[:attributes]).to have_key(:profile_image_link)
      expect(user[:attributes]).to have_key(:latitude)
      expect(user[:attributes]).to have_key(:longitude)
    end
  end
end
