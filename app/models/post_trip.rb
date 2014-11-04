class PostTrip < ActiveRecord::Base
  belongs_to :trips
  belongs_to :posts
end
