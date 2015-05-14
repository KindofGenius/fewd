require 'rails_helper'

RSpec.describe "dish_foods/new", type: :view do
  before(:each) do
    assign(:dish_food, DishFood.new(
      :dish_id => 1,
      :food_id => 1
    ))
  end

  it "renders new dish_food form" do
    render

    assert_select "form[action=?][method=?]", dish_foods_path, "post" do

      assert_select "input#dish_food_dish_id[name=?]", "dish_food[dish_id]"

      assert_select "input#dish_food_food_id[name=?]", "dish_food[food_id]"
    end
  end
end
