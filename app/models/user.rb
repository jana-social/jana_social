class User < ApplicationRecord
  before_validation :geocode

  validates :username, presence: true
  validates :zipcode, presence: true

  geocoded_by :address

  private

  def address
    [street_address, zipcode].compact.join(", ")
  end
end
