require 'rails_helper'

RSpec.describe "moods/show", type: :view do
  before(:each) do
    @mood = assign(:mood, Mood.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
