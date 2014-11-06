class TravelingsController < ApplicationController

  def create
    trip_id  = params["traveling"]["trip_id"]
    nickname = params["traveling"]["user_id"]
    user     = User.find_by_nickname(nickname)
    t = Traveling.new(user_id: user.id, trip_id: trip_id)
    if t.save
      add_contributors_posts(trip_id, user)
      flash[:success] = "#{nickname} added!"
      redirect_to trip_path(trip_id)
    else
      flash[:error] = "Something went wrong!"
      redirect_to trip_path(trip_id)
    end
  end

  def add_contributors_posts(trip_id, user)
    trip = Trip.find_by_id(trip_id)
    user.posts.each do |post|
      if post.created_date >= trip.start_date.to_datetime && post.created_date <= trip.end_date.to_datetime
        Travel.create!(post_id: post.id, trip_id: trip_id)
      end
    end
  end
end
