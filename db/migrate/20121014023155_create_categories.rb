class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :categories_phones, :id => false do |t|
      t.integer :category_id, null: false
      t.integer :phone_id, null: false
    end

  end
end
