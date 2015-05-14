require 'rails_helper'

RSpec.describe "dish_foods/show", type: :view do
  before(:each) do
    @dish_food = assign(:dish_food, DishFood.create!(
      :dish_id => 1,
      :food_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
