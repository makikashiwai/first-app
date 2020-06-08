class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :introduction, null: false
      t.string :shipping_cost, null: false
      t.string :shipping_days, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.integer :buyer, foreign_key: true
      t.timestamps
    end
  end
end
