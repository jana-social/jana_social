class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  def self.process_friendship(initiator, receiver, status)
    friendship = Friendship.find_by(user: initiator, friend: receiver)
    reverse_friendship = Friendship.find_by(user: receiver, friend: initiator) 
    
    if friendship.nil? && reverse_friendship.nil? # if a friendship does NOT exist
      friendship_status = status == :approved ? :pending : :declined
      Friendship.create(user: initiator, friend: receiver, status: friendship_status)
    elsif reverse_friendship&.status == 'pending' # if a friendship does exist (in the reverse order) and the status is pending
      reverse_friendship.update(status: :approved) if status == :approved
      reverse_friendship.update(status: :declined) if status == :declined
    end
  end
end
