class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, :limit => 25
      t.string :city, :limit => 25
      t.string :state, :limit => 2
      t.string :zip, :limit => 10
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :log, :precision => 10, :scale => 6
      t.integer :customer_id
      t.integer :delivery_id

      t.timestamps
    end
  end
end
