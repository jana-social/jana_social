class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  before_validation :geocode

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :zipcode, presence: true

  geocoded_by :address
  has_secure_password

  # returns all users that have a pending friendship with that user (and are waiting for that user to respond)
  def pending_friends
    User.joins(:friendships).where(friendships: { status: "pending", friend_id: id })
    # self.friendships.where(status: "pending")
  end

  # returns all users that the current user has an approved friendship with
  def approved_friends
    friendships_as_user = self.friendships.where(status: "approved").map(&:friend)
    friendships_as_friend = Friendship.where(friend: self, status: "approved").map(&:user)
    (friendships_as_user + friendships_as_friend).uniq
  end

  # returns all users that the current user has a declined friendship with
  def declined_friends
    friendships_as_user = self.friendships.where(status: "declined").map(&:friend)
    friendships_as_friend = Friendship.where(friend: self, status: "declined").map(&:user)
    (friendships_as_user + friendships_as_friend).uniq
  end

  # returns all users that the current user could approve or deny for friendship
  # i.e. all users that are not the current user, 
  # are not declined friends with the current user,
  # are not already approved friends with the current user, 
  # but DO include the users that are waiting for the current user to respond to a pending friendship
  def potential_friends
    my_pending_friends = User.joins(:friendships).where(friendships: { status: "pending", user_id: id })

    pending_friendships_as_user = self.friendships.where(status: "pending").map(&:friend)
    
    excluded_users = (pending_friendships_as_user + my_pending_friends + declined_friends + approved_friends + [self]).map(&:id)

    User.where.not(id: excluded_users)
  end
  private

  def address
    [street_address, "#{zipcode}, United States"].compact.join(", ") if zipcode.present?
  end
end
