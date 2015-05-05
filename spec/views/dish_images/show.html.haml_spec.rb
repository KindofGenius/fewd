require 'rails_helper'

RSpec.describe "dish_images/show", type: :view do
  before(:each) do
    @dish_image = assign(:dish_image, DishImage.create!(
      :dish_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
