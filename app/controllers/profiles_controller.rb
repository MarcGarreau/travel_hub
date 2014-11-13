class ProfilesController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    @trips = @user.trips.all
  end

end
