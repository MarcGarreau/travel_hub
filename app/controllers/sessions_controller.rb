class SessionsController < ApplicationController
  def create
    auth_params       = ActionController::Parameters.new({uid: auth_hash.uid,
                                                         provider: auth_hash.provider,
                                                         nickname: auth_hash["info"].nickname,
                                                         name: auth_hash["info"].name,
                                                         image: auth_hash["info"].image
                                                        }).permit(:provider, :uid, :name, :nickname, :image)
    user              = User.from_omniauth(auth_params)
    session[:user_id] = user.id
    uid               = auth_hash["uid"]
    token             = auth_hash["credentials"]["token"]
    response          = InstagramInterface.pull_first_posts(uid, token)
    Post.login_post_builder(response, user)
    redirect_to '/feed'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def bounce
    redirect_to "/auth/#{params[:providor]}"
  end

  def twitter
    access_token  = auth_hash["extra"]["access_token"]
    response      = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json")
    json_response = JSON.parse(response.body)
    Post.tweet_post_builder(json_response, current_user)
    # save user creds (access_token) for later pull
    redirect_to feed_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
