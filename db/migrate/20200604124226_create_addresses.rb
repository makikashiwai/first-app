class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :lastname_kana,    null: false
      t.string :firstname_kana,   null: false
      t.string :post_code,        null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :address,          null: false
      t.string :building_name
      t.string :tel_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
