class Travel < ActiveRecord::Base
  belongs_to :trip
  belongs_to :post
end
