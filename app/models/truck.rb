class Truck < ActiveRecord::Base
  attr_accessible :capacity, :delivery_id, :lic_plate
  belongs_to :delivery
end
