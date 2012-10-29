class SetConfirmedDefaultFalse < ActiveRecord::Migration
  def change
    change_column :orders, :confirmed, :boolean, default: false
  end
end
