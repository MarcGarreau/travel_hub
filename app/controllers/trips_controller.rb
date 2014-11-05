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
    @posts = current_user.posts.all #.where("properties['created_date'] >= :start_date AND properties['created_date'] <= :end_date",
             # trip.posts.all
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :user_id)
  end
end
