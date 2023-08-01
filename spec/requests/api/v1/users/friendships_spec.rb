require "rails_helper"

RSpec.describe "User Friendships API", type: :request do
  before :each do
    user_data
  end

  describe "GET /api/v1/users/:id/friendships" do
    it "returns a list of the user's approved friendships" do
      Friendship.process_friendship(@user1, @user2, :approved)
      Friendship.process_friendship(@user2, @user1, :approved)
      Friendship.process_friendship(@user1, @user3, :approved)
      Friendship.process_friendship(@user3, @user1, :approved)
      Friendship.process_friendship(@user1, @user4, :approved)
      Friendship.process_friendship(@user4, @user1, :declined)

      get "/api/v1/users/#{@user1.id}/friendships"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      friends = JSON.parse(response.body, symbolize_names: true)

      expect(friends[:data].count).to eq(2)

      friends[:data].each do |user|
        expect(user).to have_key(:id)
        expect(user).to have_key(:type)
        expect(user).to have_key(:attributes)

        expect(user[:attributes]).to have_key(:username)
        expect(user[:attributes]).to have_key(:email)
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
end
