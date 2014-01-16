class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name, :limit => 25
      t.integer :delivery_id

      t.timestamps
    end
  end
end
