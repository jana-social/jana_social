class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :messages
  has_many :rooms, through: :messages

  before_validation :geocode

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :zipcode, presence: true, format: { with: /\A\d{5}(-\d{4})?\z/, message: "must be a valid zipcode" }
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  has_secure_password

  def self.search_by_email(email)
    find_by(email == :email)
  end

  # returns all users that have a pending friendship with that user (and are waiting for that user to respond)
  def pending_friends
    User.joins(:friendships).where(friendships: { status: "pending", friend_id: id })
  end

  # returns all users that the current user has an approved friendship with
  def approved_friends
    approved_friendships_as_user = User.where(id: Friendship.where(user_id: id, status: "approved").pluck(:friend_id))
    approved_friendships_as_friend = User.where(id: Friendship.where(friend_id: id, status: "approved").pluck(:user_id))
    (approved_friendships_as_user + approved_friendships_as_friend).uniq
  end

  # returns all users that the current user has a declined friendship with
  def declined_friends
    declined_friendships_as_user = User.where(id: Friendship.where(user_id: id, status: "declined").pluck(:friend_id))
    declined_friendships_as_friend = User.where(id: Friendship.where(friend_id: id, status: "declined").pluck(:user_id))
    (declined_friendships_as_user + declined_friendships_as_friend).uniq
  end

  # returns all users that the current user could approve or deny for friendship
  def potential_friends
    my_pending_approvals = Friendship.where(user_id: id, status: "pending").pluck(:friend_id)
    declined_friendships_as_user = Friendship.where(user_id: id, status: "declined").pluck(:friend_id)
    declined_friendships_as_friend = Friendship.where(friend_id: id, status: "declined").pluck(:user_id)
    approved_friendships_as_user = Friendship.where(user_id: id, status: "approved").pluck(:friend_id)
    approved_friendships_as_friend = Friendship.where(friend_id: id, status: "approved").pluck(:user_id)

    excluded_users = my_pending_approvals +
                     declined_friendships_as_user +
                     declined_friendships_as_friend +
                     approved_friendships_as_user +
                     approved_friendships_as_friend +
                     [id]

    User.where.not(id: excluded_users)
  end

  # returns all user within a certain distance that the current user could approve or deny for friendship
  def potential_friends_nearby(distance)
    potential_friends.near(self, distance)
  end

  private

  def address
    [street_address, "#{zipcode}, United States"].compact.join(", ") if zipcode.present?
  end
end
