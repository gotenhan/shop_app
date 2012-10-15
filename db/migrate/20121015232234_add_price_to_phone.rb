class AddPriceToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :price, :decimal, default: 0.00
  end
end
