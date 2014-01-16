class Order < ActiveRecord::Base
  attr_accessible :customer_id, :delivery_id, :order_num
end
