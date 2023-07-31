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
  end

  # returns all users that have an approved friendship with that user
  def approved_friends
    friends.where(friendships: { status: "approved" })
  end

  private

  def address
    [street_address, "#{zipcode}, United States"].compact.join(", ") if zipcode.present?
  end
end
