class Cargo < ActiveRecord::Base
  attr_accessible :order_id, :quantity
  has_one :rock
  belongs_to :order
end
