require "rails_helper"

RSpec.describe "Create Friendship API" do
  let!(:user_1) { create(:user, username: "Foo", zipcode: "92315", email: "foo@gmail.com", password_digest: "test123") }
  let!(:user_2) { create(:user, username: "Barr",  zipcode: "92315", email: "barr@gmail.com", password_digest: "test123") }
  
  describe "/api/v1/friendships" do
    it "can create a new pending friendship", :vcr do
      expect(Friendship.count).to eq(0)
      
      friendship_params = ({
        user_id: user_1.id,
        friend_id: user_2.id,
        status: "approved"
      })
      
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/friendships", headers: headers, params: JSON.generate(friendship_params)
      
      friendship = Friendship.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      expect(friendship.user_id).to eq(friendship_params[:user_id])
      expect(friendship.friend_id).to eq(friendship_params[:friend_id])
      expect(friendship.status).to eq("pending")
      
      expect(Friendship.count).to eq(1)
    end

    it "can create a new approved friendship", :vcr do
      Friendship.create!(user_id: user_1.id, friend_id: user_2.id, status: "pending")
      
      friendship_params = ({
        user_id: user_2.id,
        friend_id: user_1.id,
        status: "approved"
      })
      
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/friendships", headers: headers, params: JSON.generate(friendship_params)
      
      friendship = Friendship.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      expect(friendship.user_id).to eq(friendship_params[:friend_id])
      expect(friendship.friend_id).to eq(friendship_params[:user_id])
      expect(friendship.status).to eq("approved")
      
      expect(Friendship.count).to eq(1)
    end
  end
end