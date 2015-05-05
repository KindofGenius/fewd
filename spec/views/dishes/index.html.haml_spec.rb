require 'rails_helper'

RSpec.describe "dishes/index", type: :view do
  before(:each) do
    assign(:dishes, [
      Dish.create!(
        :restaurant_id => 1,
        :name => "MyText"
      ),
      Dish.create!(
        :restaurant_id => 1,
        :name => "MyText"
      )
    ])
  end

  it "renders a list of dishes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
