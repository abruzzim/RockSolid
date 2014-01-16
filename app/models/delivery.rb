class Delivery < ActiveRecord::Base
  attr_accessible :ship_date
  has_one :address
  has_one :truck
  has_one :driver
  has_many :orders
  has_many :customers, through: :orders
end
