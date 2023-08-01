require "rails_helper"

RSpec.describe "Find Friends API", type: :request do
  before :each do
    user_data
  end

  describe "GET /api/v1/users/:id/find_friends" do
    it "returns a list of the user's possible friends based on search radius" do
      Friendship.process_friendship(@user1, @user2, :approved)
      Friendship.process_friendship(@user2, @user1, :approved)
      Friendship.process_friendship(@user1, @user3, :approved)
      Friendship.process_friendship(@user3, @user1, :approved)
      Friendship.process_friendship(@user1, @user4, :approved)
      Friendship.process_friendship(@user4, @user1, :approved)

      get "/api/v1/users/#{@user1.id}/find_friends", params: { distance: 50 }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(friends[:data].count).to eq(1)

      expect(friends[:data].first).to have_key(:id)
      expect(friends[:data].first).to have_key(:type)
      expect(friends[:data].first).to have_key(:attributes)

      expect(friends[:data].first[:attributes]).to have_key(:username)
      expect(friends[:data].first[:attributes]).to have_key(:bio)
      expect(friends[:data].first[:attributes]).to have_key(:likes)
      expect(friends[:data].first[:attributes]).to have_key(:dislikes)
      expect(friends[:data].first[:attributes]).to have_key(:profile_image_link)
    end
  end
end
