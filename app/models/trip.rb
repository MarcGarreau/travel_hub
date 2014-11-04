class Trip < ActiveRecord::Base
  validates :title,      presence: true
  validates :start_date, presence: true
  validates :end_date,   presence: true
  validates :user_id,    presence: true

  belongs_to :user
  has_many :posts_trips
  has_many :posts, through: :posts_trips

  def format_start_date
    self.start_date.strftime("%b %d, %Y")
  end

  def format_end_date
    self.end_date.strftime("%b %d, %Y")
  end
end
