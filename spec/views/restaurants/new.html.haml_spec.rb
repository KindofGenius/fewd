require 'rails_helper'

RSpec.describe "restaurants/new", type: :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :address => "MyText",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :longitude => 1.5,
      :latitude => 1.5
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "textarea#restaurant_address[name=?]", "restaurant[address]"

      assert_select "input#restaurant_city[name=?]", "restaurant[city]"

      assert_select "input#restaurant_state[name=?]", "restaurant[state]"

      assert_select "input#restaurant_country[name=?]", "restaurant[country]"

      assert_select "input#restaurant_longitude[name=?]", "restaurant[longitude]"

      assert_select "input#restaurant_latitude[name=?]", "restaurant[latitude]"
    end
  end
end
