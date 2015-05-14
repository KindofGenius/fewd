require 'rails_helper'

RSpec.describe "diet_dishes/edit", type: :view do
  before(:each) do
    @diet_dish = assign(:diet_dish, DietDish.create!(
      :dish_id => 1,
      :diet_id => 1
    ))
  end

  it "renders the edit diet_dish form" do
    render

    assert_select "form[action=?][method=?]", diet_dish_path(@diet_dish), "post" do

      assert_select "input#diet_dish_dish_id[name=?]", "diet_dish[dish_id]"

      assert_select "input#diet_dish_diet_id[name=?]", "diet_dish[diet_id]"
    end
  end
end
