class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :dish_images
  has_many :dish_moods
  has_many :moods, through: :dish_moods
  has_many :diet_dishes
  has_many :diets, through: :diet_dishes
  has_many :dish_foods
  has_many :foods, through: :dish_foods

  accepts_nested_attributes_for :dish_images
  
  scope :published, where(publish: true)

  reverse_geocoded_by "restaurants.latitude", "restaurants.longitude"
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  #acts_as_taggable_on :foods
end
