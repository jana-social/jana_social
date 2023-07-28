class User < ApplicationRecord
  before_validation :geocode

  validates :username, presence: true
  validates :zipcode, presence: true
  
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  geocoded_by :address

  private

  def address
    [street_address, zipcode].compact.join(", ")
  end
end
