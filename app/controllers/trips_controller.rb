class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.create(trip_params)

    if @trip.save
      redirect_to feed_path
    else
      render :new
    end
  end

  def show

    @trip = Trip.find(params[:id])
    byebug
    @posts = current_user.posts.where("posts.date >= @trip.start_date AND properties['created_date'].to_date <= @trip.start_date")

  end

  private

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :user_id)
  end
end
