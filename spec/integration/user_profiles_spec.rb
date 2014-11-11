require 'rails_helper'

describe User, type: :feature do

  it "can navigate to their profile page" do
    log_user_in
    user = User.find_by_nickname("notfakemarc")
    visit '/profile/' + user.id.to_s
    expect(page).to have_content "notfakemarc"
  end

  it "can navigate to another user's profile" do
    log_user_in
    user = User.create!(nickname: "the_hulk", image: "http://images.google.com/something.jpg")
    visit '/profile/' + user.id.to_s
    expect(page).to have_content "the_hulk"
  end

end
