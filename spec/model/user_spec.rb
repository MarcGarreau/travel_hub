require 'rails_helper'

describe User, type: :model do

  let(:user) { User.create( uid:      123456,
                            provider: "instagram",
                            name:     "John Doe",
                            nickname: "johndozer",
                            image:    "http://images.google.com/something.jpg" ) }

  it "is valid" do
    expect(user).to be_valid
  end

  it "knows about its trips" do
    trip = Trip.create( title:      "Vegas Baby!, Baby?, Uh oh.",
                        start_date: "2014-10-30",
                        end_date:   "2014-11-10",
                        user_id:    user.id )

    user_trip = user.trips.first

    expect(user_trip.title).to eq(trip.title)
  end
end
