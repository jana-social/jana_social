class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  def self.process_friendship(initiator, receiver, status)
    friendship = Friendship.find_by(user: initiator, friend: receiver)

    if friendship.nil? # if a friendship does NOT exist
      reverse_friendship = Friendship.find_by(user: receiver, friend: initiator) 

      if reverse_friendship.nil? # if a friendship relationship does NOT exist in the REVERSE direction
        friendship_status = status == :approved ? :pending : :declined
 
        Friendship.create(user: initiator, friend: receiver, status: friendship_status)
      else
        reverse_friendship.update(status: :approved) if status == :approved
        reverse_friendship.update(status: :declined) if status == :declined
      end
    else friendship.pending? # if a friendship does exist
      friendship.update(status: :approved) if status == :approved
      friendship.update(status: :declined) if status == :declined
    end
  end
end
