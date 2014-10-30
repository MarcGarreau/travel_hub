require 'rails_helper'

describe "OmniAuth Login", type: :feature, js: true do
  it "works" do
    visit root_path
    mock_auth
    click_link "Sign In With Instagram"
    expect(page).to have_content "Welcome"
  end
end
