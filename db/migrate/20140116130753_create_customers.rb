class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, :limit => 25

      t.timestamps
    end
  end
end
