class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :dish_images
  accepts_nested_attributes_for :dish_images
end
