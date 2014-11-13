class Comment < ActiveRecord::Base
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :body,    presence: true
  
  belongs_to :post, touch: true
  belongs_to :user, touch: true
end
