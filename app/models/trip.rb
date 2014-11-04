class Trip < ActiveRecord::Base
  validates :title,      presence: true
  validates :start_date, presence: true
  validates :end_date,   presence: true

  has_many :travelings
  has_many :users, through: :travelings

  def format_start_date
    self.start_date.strftime("%b %d, %Y")
  end

  def format_end_date
    self.end_date.strftime("%b %d, %Y")
  end
end
