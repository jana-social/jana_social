require "rails_helper"

RSpec.describe "Create Friendship API" do
  let!(:user_1) { create(:user, username: "Foo", zipcode: "80203", street_address: "505 E Colfax Ave", email: "foo@gmail.com", password_digest: "test123") }
  let!(:user_2) { create(:user, username: "Barr", zipcode: "80203", street_address: "505 E Colfax Ave", email: "barr@gmail.com", password_digest: "test123") }

  describe "/api/v1/friendships" do
    context "when no previous friendship exists between two users" do
      it "can create a new pending friendship (first user approves)", :vcr do
        expect(Friendship.count).to eq(0)

        friendship_params = {
          user_id: user_1.id,
          friend_id: user_2.id,
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

      it "can create a new declined friendship (first user declines)", :vcr do
        expect(Friendship.count).to eq(0)

        friendship_params = {
          user_id: user_1.id,
          friend_id: user_2.id,
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
      it "can create a new approved friendship (second user approves)", :vcr do
        Friendship.create!(user_id: user_1.id, friend_id: user_2.id, status: "pending")

        friendship_params = {
          user_id: user_2.id,
          friend_id: user_1.id,
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

      it "can create a new declined friendship (second user declines)", :vcr do
        Friendship.create!(user_id: user_1.id, friend_id: user_2.id, status: "pending")

        friendship_params = {
          user_id: user_2.id,
          friend_id: user_1.id,
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
