require "rails_helper"

RSpec.describe "Create Friendship API" do
  before :each do
    user_data
  end

  describe "/api/v1/friendships" do
    context "when no previous friendship exists between two users" do
      it "can create a new pending friendship (first user approves)" do
        expect(Friendship.count).to eq(0)

        friendship_params = {
          user_id: @user1.id,
          friend_id: @user2.id,
          status: "approved"
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/friendships", headers: headers, params: JSON.generate(friendship_params)

        friendship = Friendship.last

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(friendship.user_id).to eq(friendship_params[:user_id])
        expect(friendship.friend_id).to eq(friendship_params[:friend_id])
        expect(friendship.status).to eq("pending")

        expect(Friendship.count).to eq(1)
      end

      it "can create a new declined friendship (first user declines)" do
        expect(Friendship.count).to eq(0)

        friendship_params = {
          user_id: @user1.id,
          friend_id: @user2.id,
          status: "declined"
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/friendships", headers: headers, params: JSON.generate(friendship_params)

        friendship = Friendship.last

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(friendship.user_id).to eq(friendship_params[:user_id])
        expect(friendship.friend_id).to eq(friendship_params[:friend_id])
        expect(friendship.status).to eq("declined")

        expect(Friendship.count).to eq(1)
      end
    end

    context "when a previous pending friendship exists between two users" do
      it "can create a new approved friendship (second user approves)" do
        Friendship.create!(user_id: @user1.id, friend_id: @user2.id, status: "pending")

        friendship_params = {
          user_id: @user2.id,
          friend_id: @user1.id,
          status: "approved"
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/friendships", headers: headers, params: JSON.generate(friendship_params)

        friendship = Friendship.last

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(friendship.user_id).to eq(friendship_params[:friend_id])
        expect(friendship.friend_id).to eq(friendship_params[:user_id])
        expect(friendship.status).to eq("approved")

        expect(Friendship.count).to eq(1)
      end

      it "can create a new declined friendship (second user declines)" do
        Friendship.create!(user_id: @user1.id, friend_id: @user2.id, status: "pending")

        friendship_params = {
          user_id: @user2.id,
          friend_id: @user1.id,
          status: "declined"
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/friendships", headers: headers, params: JSON.generate(friendship_params)

        friendship = Friendship.last

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(friendship.user_id).to eq(friendship_params[:friend_id])
        expect(friendship.friend_id).to eq(friendship_params[:user_id])
        expect(friendship.status).to eq("declined")

        expect(Friendship.count).to eq(1)
      end
    end
  end
end
