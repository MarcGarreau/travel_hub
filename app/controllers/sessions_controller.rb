class SessionsController < ApplicationController
  def create
    auth_params       = ActionController::Parameters.new(auth_hash.slice(:provider, :uid)).permit(:provider, :uid)
    user              = User.from_omniauth(auth_params)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Welcome"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def bounce
    redirect_to "/auth/#{params[:providor]}"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
