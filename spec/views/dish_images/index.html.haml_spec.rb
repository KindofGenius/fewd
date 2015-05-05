require 'rails_helper'

RSpec.describe "dish_images/index", type: :view do
  before(:each) do
    assign(:dish_images, [
      DishImage.create!(
        :dish_id => 1
      ),
      DishImage.create!(
        :dish_id => 1
      )
    ])
  end

  it "renders a list of dish_images" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
