class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.decimal :quantity, :precision => 4, :scale => 1
      t.integer :order_id

      t.timestamps
    end
  end
end
