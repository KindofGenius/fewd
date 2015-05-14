class DishFood < ActiveRecord::Base
  belongs_to :dish
  belongs_to :food
end
