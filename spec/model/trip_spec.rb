require 'rails_helper'

RSpec.describe Trip, type: :model do
  it "is a valid Trip" do
    trip = Trip.create( title:      "Vegas Baby!",
                        start_date: "2014-10-30",
                        end_date:   "2014-10-31")

    expect(trip).to be_valid
  end

  it "is not a valid Trip" do
    trip = Trip.create( title:      nil,
                        start_date: "2014-10-30",
                        end_date:   "2014-10-31")

    expect(trip).not_to be_valid
  end

  it "is not a valid Trip" do
    trip = Trip.create( title:      "Vegas Baby!, Baby?, I'm prego",
                        start_date: nil,
                        end_date:   "2014-10-31")

    expect(trip).not_to be_valid
  end

  it "is not a valid Trip" do
    trip = Trip.create( title:      "Vegas Baby!",
                        start_date: "2014-10-30",
                        end_date:   nil)

    expect(trip).not_to be_valid
  end

  it "shows formatted start_date" do
    trip = Trip.create( title:      "Oh Canada!",
                        start_date: "2014-10-30",
                        end_date:   "2014-11-03")

    expect(trip.format_start_date).to eq("Oct 30, 2014")
  end

  it "shows formatted end_date" do
    trip = Trip.create( title:      "Oh Canada!",
                        start_date: "2014-10-30",
                        end_date:   "2014-11-03")

    expect(trip.format_end_date).to eq("Nov 03, 2014")
  end

  it "knows its user" do
    user = User.create( name: "Boogly-Boo",
                        nickname: "boo-boo")
    trip = Trip.create( title: "Oh Canada!",
                        start_date: "2014-10-30",
                        end_date: "2014-11-03",
                        user_id: user.id)

    expect(trip.user.name).to eq("Boogly-Boo")
  end
end
