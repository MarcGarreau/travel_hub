class Post < ActiveRecord::Base
  belongs_to :user

  store_accessor :properties, :tweet_url, :tweet_date
end
