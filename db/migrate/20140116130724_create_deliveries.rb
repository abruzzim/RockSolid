class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.date :ship_date

      t.timestamps
    end
  end
end
