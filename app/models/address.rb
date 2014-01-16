class Address < ActiveRecord::Base
  attr_accessible :city, :customer_id, :delivery_id, :lat, :log, :state, :street, :zip
end
