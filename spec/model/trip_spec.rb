require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:trip) { Trip.create( title:      "Vegas Baby!, Baby?, Uh oh.",
                            start_date: "2014-10-30",
                            end_date:   "2014-11-10",
                            user_id:    1 ) }

  it "is valid" do
    expect(trip).to be_valid
  end

  it "is invalid without title" do
    trip.title = nil

    expect(trip).not_to be_valid
  end

  it "is invalid without start_date" do
    trip.start_date = nil

    expect(trip).not_to be_valid
  end

  it "is invalid without end_date" do
    trip.end_date = nil

    expect(trip).not_to be_valid
  end

  it "is invalid without a user_id" do
    trip.user_id = nil

    expect(trip).not_to be_valid
  end

  it "shows formatted start_date" do
    expect(trip.format_start_date).to eq("Oct 30, 2014")
  end

  it "shows formatted end_date" do
    expect(trip.format_end_date).to eq("Nov 10, 2014")
  end

  it "knows its user" do
    user = User.create( name: "Boogly-Boo" )
    trip.user_id = user.id

    expect(trip.user.name).to eq("Boogly-Boo")
  end
end
