class CreateRocks < ActiveRecord::Migration
  def change
    create_table :rocks do |t|
      t.string :rtype, :limit => 25
      t.string :rgrade, :limit => 25
      t.string :rform, :limit => 25
      t.decimal :rthickness, :precision => 3, :scale => 1
      t.decimal :unit_price, :precision => 9, :scale => 2
      t.integer :cargo_id

      t.timestamps
    end
  end
end
