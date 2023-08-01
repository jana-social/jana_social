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
  validates :password, presence: true
  validates :zipcode, presence: true

  geocoded_by :address
  has_secure_password

  def self.search_by_email(email)
    find_by(:email == email)
  end

  # returns all users that have a pending friendship with that user (and are waiting for that user to respond)
  def pending_friends
    User.joins(:friendships).where(friendships: { status: "pending", friend_id: id })
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
