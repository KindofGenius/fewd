require 'rails_helper'

RSpec.describe "Hoods", type: :request do
  describe "GET /hoods" do
    it "works! (now write some real specs)" do
      get hoods_path
      expect(response).to have_http_status(200)
    end
  end
end
