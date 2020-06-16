# README


# 💻 Project Title
## *first-app*
![Screenshot from Gyazo](https://i.gyazo.com/7f87ee93f4a7c0d4852f2b20c525110b.jpg)


# 🔎 Title
## *Merket*


# 💬 Description
  検索・購入サイトのアプリケーションです。  
  ウィザード形式での新規登録（登録後メール認証があります）、
  多階層カテゴリーの商品検索、クレジットカードでの商品購入をすることができます。  
  **※実際に取引を行うことはできません。**
 
 
# 🌐 App URL
 - IPアドレス：**http://54.168.99.6**
### Basic認証
 - ID：makikashiwai0529
 - Pass：kasipan29
### テストユーザー情報
**アカウント**
 - Email：t75.kashiwai.maki@gmail.com
 - Pass：kashiwaimaki29


# 💡 制作背景(意図)
コロナウィルスでマスクが無くなったり、日常に必要な物がどこに売っているのかわからない状況を改善できないかと思い、
今欲しい物が近所のどこのスーパー、コンビニにあるのかを検索できるサービスを考えました。
自分自身も近所のスーパーを何店舗もハシゴして買い物をしなければならないという不便な経験をしました。
検索をすることで、できるだけ買い物の時間を省くことができ、時間の効率にも繋がります。
また、新たな生活様式としてデリバリーの普及が増えているため、
検索できるだけでなくスーパー、コンビ二等の商品をデリバリー可能とし、クレジット決済機能もつけ、若者からお年寄りまで便利に使うことができると考えております。


# 👀 DEMO
- [トップページ](https://i.gyazo.com/b7c61cc43f877b8e67c03dd4445e9342.mp4)
- [マイページ](https://i.gyazo.com/9a6ce6339f3e6f92b8007b814c9187d0.mp4)
- [購入機能](https://i.gyazo.com/04766f8c75e66c8c544431065768f2cd.mp4)
- [検索機能](https://i.gyazo.com/acac8220b6632e1d61512146489b51c1.mp4)

# 💦 工夫ポイント
検索することが1番の目的なので様々な所から検索ができるよう検索場所を３つ作り、
検索後は商品が見やすいようにシンプルなビューにしております。


# 💪 実装予定
- GoogleMapsAPIを使用した地図検索
- 管理者と一般ユーザーの別アクション
- 買い物カゴ


# 🎨 DB設計

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
|introduction|string|
|shipping_cost|string|null: false|
|shipping_days|string|null: false|
|category_id|references|null: false, foreign_key: true
|store_id|eferences|null: false, foreign_key: true|
|buyer|integer|

### Association
 - belongs_to :store
 - belongs_to :category
 - has_many :images dependent: :destroy


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|null: false, foreign_key: true|

### Association
 - belongs_to :product


## storeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
 - has_many :products
