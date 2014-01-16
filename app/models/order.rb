class Order < ActiveRecord::Base
  attr_accessible :customer_id, :delivery_id, :order_num
  has_one :cargo
  has_one :rock, through: :cargo
  belongs_to :customer
  belongs_to :delivery
end
