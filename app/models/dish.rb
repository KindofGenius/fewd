class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :dish_images
  has_many :dish_moods
  has_many :moods, through: :dish_moods

  accepts_nested_attributes_for :dish_images

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
