require 'rails_helper'

RSpec.describe "dish_images/edit", type: :view do
  before(:each) do
    @dish_image = assign(:dish_image, DishImage.create!(
      :dish_id => 1
    ))
  end

  it "renders the edit dish_image form" do
    render

    assert_select "form[action=?][method=?]", dish_image_path(@dish_image), "post" do

      assert_select "input#dish_image_dish_id[name=?]", "dish_image[dish_id]"
    end
  end
end
