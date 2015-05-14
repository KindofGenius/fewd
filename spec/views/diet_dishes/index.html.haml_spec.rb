require 'rails_helper'

RSpec.describe "diet_dishes/index", type: :view do
  before(:each) do
    assign(:diet_dishes, [
      DietDish.create!(
        :dish_id => 1,
        :diet_id => 2
      ),
      DietDish.create!(
        :dish_id => 1,
        :diet_id => 2
      )
    ])
  end

  it "renders a list of diet_dishes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
