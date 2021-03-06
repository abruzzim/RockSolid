class Customer < ActiveRecord::Base
  attr_accessible :name
  has_many :addresses #, autosave: true
  has_many :orders
  has_many :deliveries, through: :orders
end
