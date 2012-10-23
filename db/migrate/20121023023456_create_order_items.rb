class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity, default: 0, null: false
      t.decimal :price, default: 0.0, null: false

      t.integer :order_id, null: false
      t.integer :phone_id, null: false

      t.timestamps
    end
  end
end
