class Restaurant < ActiveRecord::Base
  has_many :dishes
  has_many :restaurant_services
  has_many :services, through: :restaurant_services

  accepts_nested_attributes_for :restaurant_services

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode    # auto-fetch coordinates


  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  
  def full_street_address
    [address, city, state, country].compact.join(', ')
  end
end
