class TravelingsController < ApplicationController

  def create
    trip_id  = params["trip_id"]
    user_id  = params["user_id"]
    user     = User.find_by_id(user_id)
    t = Traveling.new(user_id: user.id, trip_id: trip_id)
    if t.save
      add_contributors_posts(trip_id, user)
      flash[:success] = "#{user.nickname} added!"
      redirect_to trip_path(trip_id)
    else
      flash[:error] = "Something went wrong!"
      redirect_to trip_path(trip_id)
    end
  end

  def add_contributors_posts(trip_id, user)
    trip = Trip.find_by_id(trip_id)
    user.posts.each do |post|
      if post.created_date.between?(trip.start_date, trip.end_date)
        Travel.create!(post_id: post.id, trip_id: trip_id)
      end
    end
  end
end
