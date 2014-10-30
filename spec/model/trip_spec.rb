require 'rails_helper'

RSpec.describe Trip, type: :model do
  it "is valid" do
    trip = Trip.create( title:      "Vegas Baby!",
                        start_date: "2014-10-30",
                        end_date:   "2014-10-31",
                        user_id:    1)

    expect(trip).to be_valid
  end

  it "is invalid without title" do
    trip = Trip.create( title:      nil,
                        start_date: "2014-10-30",
                        end_date:   "2014-10-31",
                        user_id:    1)

    expect(trip).not_to be_valid
  end

  it "is invalid without start_date" do
    trip = Trip.create( title:      "Vegas Baby!, Baby?, I'm prego",
                        start_date: nil,
                        end_date:   "2014-10-31",
                        user_id:    1)

    expect(trip).not_to be_valid
  end

  it "is invalid without end_date" do
    trip = Trip.create( title:      "Vegas Baby!",
                        start_date: "2014-10-30",
                        end_date:   nil,
                        user_id:    1)

    expect(trip).not_to be_valid
  end

  it "is invalid without a user_id" do
    trip = Trip.create( title:      "Maui Wowi",
                        start_date: "2014-10-30",
                        end_date:   "2014-11-02",
                        user_id:    nil)

    expect(trip).not_to be_valid
  end

  it "shows formatted start_date" do
    trip = Trip.create( title:      "Oh Canada!",
                        start_date: "2014-10-30",
                        end_date:   "2014-11-03",
                        user_id:    1)

    expect(trip.format_start_date).to eq("Oct 30, 2014")
  end

  it "shows formatted end_date" do
    trip = Trip.create( title:      "Oh Canada!",
                        start_date: "2014-10-30",
                        end_date:   "2014-11-03",
                        user_id:    1)

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
