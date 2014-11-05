require 'rails_helper'

describe "User" do
  it "can create associated trips" do
    user = User.create!(name: "Joe Shmoe", nickname: "joe")
    user.trips.create!(title: "My Trip",
                       start_date: "2014-10-05",
                       end_date: "2014-11-05")
    expect(user.trips.first.title).to eq "My Trip"
  end

  it "can be belong to trips" do
    trip = Trip.create!(title: "My Adventure",
                        start_date: "2014-11-02",
                        end_date: "2014-11-20")
    trip.users.create!(name: "Sally Darling", nickname: "sally")
    expect(trip.users.first.name).to eq "Sally Darling"
  end
end
