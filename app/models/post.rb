class Post < ActiveRecord::Base
  belongs_to :user

  store_accessor :properties, :tweet_url, :tweet_date

  def self.login_post_builder(response, user)
    response["data"].each do |post|
      new_post = user.posts.new

      new_post_attrs = {}
      new_post_attrs["longitude"]    = post["location"]["longitude"]
      new_post_attrs["latitude"]     = post["location"]["latitude"]
      new_post_attrs["place_name"]   = post["location"]["name"]
      new_post_attrs["url"]          = post["images"]["standard_resolution"]["url"]
      new_post_attrs["caption"]      = post["caption"]["text"]
      new_post_attrs["created_date"] = Time.at(post["caption"]["created_time"].to_i).to_datetime

      new_post.properties = new_post_attrs
      new_post.source     = "Instagram"
    end
    user.save
  end
end
