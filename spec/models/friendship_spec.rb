require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'class methods' do
    describe '#process_friendship' do
      before(:each) do
        @user1 = User.create!(username: "Foo", street_address: "990 Summit Blvd", zipcode: "92315", email: "foo@gmail.com", password_digest: "test123")
        @user2 = User.create!(username: "Barr", street_address: "990 Summit Blvd", zipcode: "92315", email: "barr@gmail.com", password_digest: "test123")
      end

      context 'when no previous friendship exists between two users' do
        it 'creates a new friendship with a status of pending if first user approves', :vcr do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(Friendship.last.status).to eq('pending')
          expect(Friendship.where(user: @user1, friend: @user2, status: :pending)).to exist
          expect(Friendship.where(user: @user2, friend: @user1)).to_not exist
        end

        it 'creates a new friendship with a status of declined if first user declines', :vcr do
          Friendship.process_friendship(@user1, @user2, :declined)
          expect(Friendship.last.status).to eq('declined')
          expect(Friendship.where(user: @user1, friend: @user2, status: :declined)).to exist
          expect(Friendship.where(user: @user2, friend: @user1)).to_not exist
        end
      end

      context 'when a previous pending friendship exists between two users' do
        it 'updates the status of the friendship to approved if second user also approves', :vcr do
          Friendship.process_friendship(@user1, @user2, :approved)
          Friendship.process_friendship(@user2, @user1, :approved)
          expect(Friendship.last.status).to eq('approved')
          expect(Friendship.where(user: @user1, friend: @user2, status: :approved)).to exist
        end

        it 'updates the status of the friendship to declined if second user declines', :vcr do
          Friendship.process_friendship(@user1, @user2, :approved)
          Friendship.process_friendship(@user2, @user1, :declined)
          expect(Friendship.last.status).to eq('declined')
          expect(Friendship.where(user: @user1, friend: @user2, status: :declined)).to exist
        end
      end
    end
  end
end
