class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_num, :limit => 25
      t.integer :customer_id
      t.integer :delivery_id

      t.timestamps
    end
  end
end
