class Event < ApplicationRecord
  before_validation :geocode

  validates :title, presence: true
  validates :zipcode, presence: true

  geocoded_by :address

  private

  def address
    [street_address, zipcode].compact.join(", ")
  end
end
