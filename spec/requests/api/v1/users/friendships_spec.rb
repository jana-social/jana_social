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

      friendships = JSON.parse(response.body, symbolize_names: true)

      expect(friendships[:data].count).to eq(2)

      friendships[:data].each do |friendship|
        expect(friendship).to have_key(:id)
        expect(friendship).to have_key(:type)
        expect(friendship).to have_key(:attributes)

        expect(friendship[:attributes]).to have_key(:user_id)
        expect(friendship[:attributes]).to have_key(:friend_id)
        expect(friendship[:attributes]).to have_key(:status)
      end
    end
  end
end