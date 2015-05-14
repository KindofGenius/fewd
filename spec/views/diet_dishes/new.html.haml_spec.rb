require 'rails_helper'

RSpec.describe "diet_dishes/new", type: :view do
  before(:each) do
    assign(:diet_dish, DietDish.new(
      :dish_id => 1,
      :diet_id => 1
    ))
  end

  it "renders new diet_dish form" do
    render

    assert_select "form[action=?][method=?]", diet_dishes_path, "post" do

      assert_select "input#diet_dish_dish_id[name=?]", "diet_dish[dish_id]"

      assert_select "input#diet_dish_diet_id[name=?]", "diet_dish[diet_id]"
    end
  end
end
