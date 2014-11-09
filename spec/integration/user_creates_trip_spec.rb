require 'rails_helper'

describe "User", type: :feature do

  it "can create a trip" do
    log_user_in
    visit new_trip_path
    fill_in "trip[title]",      with: "First Trip"
    fill_in "trip[start_date]", with: "2014/09/15"
    fill_in "trip[end_date]",   with: "2014/11/15"
    click_link_or_button "Create Trip"
    expect(page).to have_content "First Trip"
  end

  it "can add a user to a trip" do
    log_user_in
    visit new_trip_path
    fill_in "trip[title]",      with: "First Trip"
    fill_in "trip[start_date]", with: "2014/09/15"
    fill_in "trip[end_date]",   with: "2014/11/15"
    click_link_or_button "Create Trip"
    expect(page).to have_content "First Trip"
    select "boo", from: "user_id"
    click_link_or_button "+"
    expect(page).to have_content "boo added!"
  end
end

