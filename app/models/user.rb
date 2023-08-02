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
  validates :zipcode, presence: true

  before_create do
    self.profile_image_link = PhotoFacade.new.get_photo.url
  end

  geocoded_by :address
  has_secure_password

  def find_friends_within_distance(distance)
    User.near(self, distance)
  end

  def self.search_by_email(email)
    find_by(:email == email)
  end

  private

  def address
    [street_address, "#{zipcode}, United States"].compact.join(", ") if zipcode.present?
  end
end
