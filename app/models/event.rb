class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  
  before_validation :geocode

  validates :title, presence: true
  validates :zipcode, presence: true

  geocoded_by :address

  private

  def address
    [street_address, zipcode].compact.join(", ")
  end
end
