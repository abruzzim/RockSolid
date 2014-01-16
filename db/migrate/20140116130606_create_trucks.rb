class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :lic_plate, :limit => 10
      t.decimal :capacity, :precision => 4, :scale => 1
      t.integer :delivery_id

      t.timestamps
    end
  end
end
