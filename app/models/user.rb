class User < ActiveRecord::Base
  has_many :posts
  has_many :travelings
  has_many :trips, through: :travelings

  def self.from_omniauth(auth)
    where(auth).first_or_create do |user|
      user.provider = auth['provider']
      user.uid      = auth['uid'].to_i
      user.name     = auth['name']
      user.nickname = auth['nickname']
      user.image    = auth['image']
    end
  end
end
