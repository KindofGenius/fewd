require 'rails_helper'

RSpec.describe "email_updates/show", type: :view do
  before(:each) do
    @email_update = assign(:email_update, EmailUpdate.create!(
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
  end
end
