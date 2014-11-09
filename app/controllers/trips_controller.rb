class TripsController < ApplicationController

  def index
    @trips = current_user.trips.all
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

  if @trip.update(trip_params)
    redirect_to @trip
  else
    render 'edit'
  end

  end

  def create
    @trip = current_user.trips.create(trip_params)

    if @trip.save
      # create a row in the travels table for each post within the selected dates
      start_date = params["trip"]["start_date"]
      end_date   = params["trip"]["end_date"]
      @trip.users.each do |user|
        user.posts.each do |post|
          if post.created_date >= start_date.to_datetime && post.created_date <= end_date.to_datetime
            Travel.create!(post_id: post.id, trip_id: @trip.id)
          end
        end
      end
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @posts = @trip.posts.all.sort_by{|post| post.created_date }
    @users = User.all
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :user_id)
  end
end
