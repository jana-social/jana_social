require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'class methods' do
    before(:each) do
      @user1 = create(:user)
      @user2 = create(:user)
    end
    describe '#process_friendship' do
      context 'when no previous friendship exists between two users' do
        it 'creates a new friendship with a status of pending if first user approves' do
          Friendship.process_friendship(@user1, @user2, :approved)
          expect(Friendship.last.status).to eq('pending')
          expect(Friendship.where(user: @user1, friend: @user2, status: :pending)).to exist
          expect(Friendship.where(user: @user2, friend: @user1)).to_not exist
        end

        it 'creates a new friendship with a status of declined if first user declines' do
          Friendship.process_friendship(@user1, @user2, :declined)
          expect(Friendship.last.status).to eq('declined')
          expect(Friendship.where(user: @user1, friend: @user2, status: :declined)).to exist
          expect(Friendship.where(user: @user2, friend: @user1)).to_not exist
        end
      end
    end
  end
end
