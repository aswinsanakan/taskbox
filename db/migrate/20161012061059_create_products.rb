class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :brand
      t.string :size
      t.string :discount
      t.string :color
      t.boolean :availability

      t.timestamps null: false
    end
  end
end
