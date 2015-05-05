require 'rails_helper'

RSpec.describe "moods/edit", type: :view do
  before(:each) do
    @mood = assign(:mood, Mood.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit mood form" do
    render

    assert_select "form[action=?][method=?]", mood_path(@mood), "post" do

      assert_select "input#mood_name[name=?]", "mood[name]"
    end
  end
end
