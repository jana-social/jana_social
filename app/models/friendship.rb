class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  def self.process_friendship(user, friend, status)
    friendship = Friendship.find_by(user: user, friend: friend)
    reverse_friendship = Friendship.find_by(user: friend, friend: user) 
    
    if friendship.nil? && reverse_friendship.nil? # if a friendship does NOT exist
      friendship_status = status == :approved ? :pending : :declined
      Friendship.create(user: user, friend: friend, status: friendship_status)
    elsif reverse_friendship&.status == 'pending' # if a friendship does exist (in the reverse order) and the status is pending
      reverse_friendship.update(status: :approved) if status == :approved
      reverse_friendship.update(status: :declined) if status == :declined
    end
  end

  def self.find_friendship(user, friend)
    Friendship.find_by(user: user, friend: friend) || Friendship.find_by(user: friend, friend: user)
  end
end
