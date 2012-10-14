class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :name, null: false
      t.string :model_name
      t.string :manufacturer, null: false
      t.integer :ram
      t.string :processor
      t.string :gpu
      t.boolean :gps
      t.boolean :wifi
      t.float :bluetooth
      t.string :os
      t.float :os_version

      t.timestamps
    end
  end
end
