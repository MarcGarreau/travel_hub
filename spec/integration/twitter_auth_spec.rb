require 'rails_helper'

describe 'User authorizes twitter', type: :feature do
  let(:user) { User.create!(name: "Joe Shmoe", nickname: "joe") }

  xit "saves their tweets" do
    log_user_in
    visit feed_path
    click_link_or_button "Add Twitter"
    # stub twitter response
    expect(page).to have_content "Twitter added!"
  end
end
