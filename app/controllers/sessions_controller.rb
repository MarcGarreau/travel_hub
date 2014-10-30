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

    uid   = auth_hash["uid"]
    token = auth_hash["credentials"]["token"]
    response = HTTParty.get("https://api.instagram.com/v1/users/#{uid}/media/recent?access_token=#{token}")

    response["data"].each do |post|
      new_post = user.posts.new

      hash = {}
      hash["longitude"]    = post["location"]["longitude"]
      hash["latitude"]     = post["location"]["latitude"]
      hash["place_name"]   = post["location"]["name"]
      hash["url"]          = post["images"]["standard_resolution"]["url"]
      hash["caption"]      = post["caption"]["text"]
      hash["created_date"] = Time.at(post["caption"]["created_time"].to_i).to_datetime

      new_post.properties = hash
    end

    redirect_to feed_path

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
