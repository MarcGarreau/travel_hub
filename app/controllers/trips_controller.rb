class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.trips.all
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def update
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
        user.posts.where.not(created_date: nil).each do |post|
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
    @posts   = @trip.posts.where(hide: false).sort_by { |post| post.created_date }
    @users   = User.all
    @comment = Comment.new
  end

  def destroy
    if @trip.destroy
      redirect_to trips_path, notice: 'Trip was successfully deleted.'
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date, :user_id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
