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

  def find_friends_within_distance(distance)
  nearby_users = User.near([latitude, longitude], distance)
   # returns users within 'distance' miles of a point
  nearby_friends = nearby_users.where.not(id: id)
  nearby_friends
    # will return a collection of users who are located near the current user's 
    # geolocation, excluding the current user from the results.
  end

  def self.search_by_email(email)
    find_by(:email == email)
  end

  private

  def address
    [street_address, "#{zipcode}, United States"].compact.join(", ") if zipcode.present?
  end
end
