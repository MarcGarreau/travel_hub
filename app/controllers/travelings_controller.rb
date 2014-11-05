class TravelingsController < ApplicationController

  def create
    trip_id  = params["traveling"]["trip_id"]
    nickname = params["traveling"]["user_id"]
    user     = User.find_by_nickname(nickname)
    t = Traveling.new(user_id: user.id, trip_id: trip_id)
    if t.save
      flash[:success] = "#{nickname} added!"
      redirect_to trip_path(trip_id)
    else
      flash[:error] = "Something went wrong!"
      redirect_to trip_path(trip_id)
    end
  end

end
