require 'rails_helper'

RSpec.describe "dishes/edit", type: :view do
  before(:each) do
    @dish = assign(:dish, Dish.create!(
      :restaurant_id => 1,
      :name => "MyText"
    ))
  end

  it "renders the edit dish form" do
    render

    assert_select "form[action=?][method=?]", dish_path(@dish), "post" do

      assert_select "input#dish_restaurant_id[name=?]", "dish[restaurant_id]"

      assert_select "textarea#dish_name[name=?]", "dish[name]"
    end
  end
end
