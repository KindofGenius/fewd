require 'rails_helper'

RSpec.describe "dish_foods/edit", type: :view do
  before(:each) do
    @dish_food = assign(:dish_food, DishFood.create!(
      :dish_id => 1,
      :food_id => 1
    ))
  end

  it "renders the edit dish_food form" do
    render

    assert_select "form[action=?][method=?]", dish_food_path(@dish_food), "post" do

      assert_select "input#dish_food_dish_id[name=?]", "dish_food[dish_id]"

      assert_select "input#dish_food_food_id[name=?]", "dish_food[food_id]"
    end
  end
end
