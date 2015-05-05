class DishMood < ActiveRecord::Base
  belongs_to :dish
  belongs_to :mood
end
