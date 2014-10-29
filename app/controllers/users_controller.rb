class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save?
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to '/'
    else
      flash[:error] = "Something went wrong!"
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :provider, :name, :nickname)
  end
end
