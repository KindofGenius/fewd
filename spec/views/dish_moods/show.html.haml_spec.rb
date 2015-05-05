require 'rails_helper'

RSpec.describe "dish_moods/show", type: :view do
  before(:each) do
    @dish_mood = assign(:dish_mood, DishMood.create!(
      :dish_id => 1,
      :mood_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
