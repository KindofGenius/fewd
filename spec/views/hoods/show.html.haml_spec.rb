require 'rails_helper'

RSpec.describe "hoods/show", type: :view do
  before(:each) do
    @hood = assign(:hood, Hood.create!(
      :address => "MyText",
      :city => "MyText",
      :state => "MyText",
      :country => "MyText",
      :longitude => "MyText",
      :latitude => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
