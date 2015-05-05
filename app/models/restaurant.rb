class Restaurant < ActiveRecord::Base
  has_many :dishes

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode    # auto-fetch coordinates

  def full_street_address
    [address, city, state, country].compact.join(', ')
  end
end
