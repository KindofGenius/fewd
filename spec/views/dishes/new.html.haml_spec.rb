require 'rails_helper'

RSpec.describe "dishes/new", type: :view do
  before(:each) do
    assign(:dish, Dish.new(
      :restaurant_id => 1,
      :name => "MyText"
    ))
  end

  it "renders new dish form" do
    render

    assert_select "form[action=?][method=?]", dishes_path, "post" do

      assert_select "input#dish_restaurant_id[name=?]", "dish[restaurant_id]"

      assert_select "textarea#dish_name[name=?]", "dish[name]"
    end
  end
end
