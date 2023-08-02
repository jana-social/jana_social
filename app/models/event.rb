class Event < ApplicationRecord
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users

  before_validation :geocode

  validates :title, presence: true
  validates :zipcode, presence: true, format: { with: /\A\d{5}(-\d{4})?\z/, message: "must be a valid zipcode" }
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address

  private

  def address
    [street_address, "#{zipcode}, United States"].compact.join(", ") if zipcode.present?
  end
end
