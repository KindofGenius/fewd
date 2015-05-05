require 'rails_helper'

RSpec.describe "dish_images/new", type: :view do
  before(:each) do
    assign(:dish_image, DishImage.new(
      :dish_id => 1
    ))
  end

  it "renders new dish_image form" do
    render

    assert_select "form[action=?][method=?]", dish_images_path, "post" do

      assert_select "input#dish_image_dish_id[name=?]", "dish_image[dish_id]"
    end
  end
end
