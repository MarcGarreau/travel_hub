require 'rails_helper'

describe 'API', type: :feature do
  it "serves a user's JSON" do
      user = User.create!(name: "Joe Shmo", nickname: "joester")
      visit api_v1_user_path(user.id)
      expect(page).to have_content("joester")
  end

  it "serves many user's JSON" do
    user = User.create!(name: "Joe Shmo", nickname: "joester")
    user = User.create!(name: "Sally Shmo", nickname: "sallster")
    visit api_v1_users_path
    expect(page).to have_content("joester")
    expect(page).to have_content("sallster")
  end
end

