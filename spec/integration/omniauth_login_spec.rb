require 'rails_helper'

describe "OmniAuth Login", type: :feature do
  it "works" do
    VCR.use_cassette('login') do
      visit root_path
      mock_auth
      click_link "Sign In With Instagram"
      expect(page).to have_content "Trips"
    end
  end
end
