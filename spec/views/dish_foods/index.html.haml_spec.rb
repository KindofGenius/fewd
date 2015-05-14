require 'rails_helper'

RSpec.describe "dish_foods/index", type: :view do
  before(:each) do
    assign(:dish_foods, [
      DishFood.create!(
        :dish_id => 1,
        :food_id => 2
      ),
      DishFood.create!(
        :dish_id => 1,
        :food_id => 2
      )
    ])
  end

  it "renders a list of dish_foods" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
