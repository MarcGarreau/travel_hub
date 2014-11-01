class InstagramInterface

  def self.pull_first_posts(uid, token)
    HTTParty.get("https://api.instagram.com/v1/users/#{uid}/media/recent?access_token=#{token}")
  end
end
