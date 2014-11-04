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

  def self.tweet_post_builder(response, user)
    response.each do |post|
      new_post = user.posts.new

      new_post_attrs = {}
      new_post_attrs["text"]         = post["text"]
      new_post_attrs["created_date"] = post["created_at"].to_datetime
      new_post_attrs["image_url"]    = post["entities"]["media"].first["media_url"] unless post["entities"]["media"] == nil
      new_post_attrs["latitude"]     = post["geo"]["coordinates"].first unless post["geo"] == nil
      new_post_attrs["longitude"]    = post["geo"]["coordinates"].last unless post["geo"] == nil

      new_post.properties = new_post_attrs
      new_post.source     = "Twitter"
    end
    user.save
  end
end
