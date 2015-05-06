class RestaurantService < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :service
end
