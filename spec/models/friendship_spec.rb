require "rails_helper"

RSpec.describe Friendship, type: :model do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name("User") }
  end

  describe "class methods" do
    before(:each) do
      @user1 = User.create!(username: "Foo", zipcode: "80203", street_address: "505 E Colfax Ave", email: "foo@gmail.com", password_digest: "test123")
      @user2 = User.create!(username: "Barr", zipcode: "80203", street_address: "505 E Colfax Ave", email: "barr@gmail.com", password_digest: "test123")
    end

    describe "#process_friendship" do
      context "when no previous friendship exists between two users" do
        it "creates a new friendship with a status of pending if first user approves", :vcr do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(Friendship.last.status).to eq("pending")
          expect(Friendship.where(user: @user1, friend: @user2, status: :pending)).to exist
          expect(Friendship.where(user: @user2, friend: @user1)).to_not exist
        end

        it "creates a new friendship with a status of declined if first user declines", :vcr do
          Friendship.process_friendship(@user1, @user2, :declined)
          expect(Friendship.last.status).to eq("declined")
          expect(Friendship.where(user: @user1, friend: @user2, status: :declined)).to exist
          expect(Friendship.where(user: @user2, friend: @user1)).to_not exist
        end
      end

      context "when a previous pending friendship exists between two users" do
        it "updates the status of the friendship to approved if second user also approves", :vcr do
          Friendship.process_friendship(@user1, @user2, :approved)
          Friendship.process_friendship(@user2, @user1, :approved)
          expect(Friendship.last.status).to eq("approved")
          expect(Friendship.where(user: @user1, friend: @user2, status: :approved)).to exist
        end

        it "updates the status of the friendship to declined if second user declines", :vcr do
          Friendship.process_friendship(@user1, @user2, :approved)
          Friendship.process_friendship(@user2, @user1, :declined)
          expect(Friendship.last.status).to eq("declined")
          expect(Friendship.where(user: @user1, friend: @user2, status: :declined)).to exist
        end
      end
    end

    describe "#find_friendship" do
      it "finds a friendship between two users", :vcr do
        Friendship.process_friendship(@user1, @user2, :approved)
        expect(Friendship.find_friendship(@user1, @user2)).to eq(Friendship.last)
        expect(Friendship.find_friendship(@user2, @user1)).to eq(Friendship.last)
      end
    end
  end
end
