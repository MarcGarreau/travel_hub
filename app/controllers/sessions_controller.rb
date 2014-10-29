class SessionsController < ApplicationController
  def create
    auth_params = ActionController::Parameters.new(auth_hash.slice(:provider, :uid)).permit(:provider, :uid)
    @user       = User.from_omniauth(auth_params)
    binding.pry
    #self.current_user = @user

    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
