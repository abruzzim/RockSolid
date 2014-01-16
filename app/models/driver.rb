class Driver < ActiveRecord::Base
  attr_accessible :delivery_id, :name
  belongs_to :delivery
end
