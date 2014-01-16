class Rock < ActiveRecord::Base
  attr_accessible :cargo_id, :rform, :rgrade, :rthickness, :rtype, :unit_price
  belongs_to :cargo
end
