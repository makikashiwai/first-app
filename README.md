# README

## userテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true, defalt: ""|
|encrypted_password|string|null: false|default: ""｜
|last_name|string|null: false|
|first_name|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_day|date|null: false|

### Association
 - has_one :address dependent: :destroy
 - has_one :card dependent: :destroy


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel_number|string|
|user|references|null: false, foreign_key:true|

### Association
 - belongs_to :user, optional: true
 - belongs_to_active_hash :prefecture


## cardテーブル #payjp
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false|
|customer_id|string|null: false|
|user|references|null:false, foreign_key: true|

### Association
 - belongs_to:user


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
 - has_many :products
 - has_ancestry


##  productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null:false|
|introduction|text|
|status|string|null: false|
|shipping_cost|string|null: false|
|shipping_days|string|null: false|
|category_id|references|null: false, foreign_key: true
|store_id|integer|null: false, foreign_key: true|
|buyer|integer|

### Association
 - belongs_to :store
 - belongs_to :category
 - has_many :images dependent: :destroy


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
 - belongs_to :item


## storeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
 - has_many :products
