require 'rails_helper'

RSpec.describe "email_updates/edit", type: :view do
  before(:each) do
    @email_update = assign(:email_update, EmailUpdate.create!(
      :email => "MyString"
    ))
  end

  it "renders the edit email_update form" do
    render

    assert_select "form[action=?][method=?]", email_update_path(@email_update), "post" do

      assert_select "input#email_update_email[name=?]", "email_update[email]"
    end
  end
end
