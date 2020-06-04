class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :last_name,      presence: true
  validates :first_name,     presence: true
  validates :lastname_kana,  presence: true
  validates :firstname_kana, presence: true
  validates :post_code,      presence: true
  validates :prefecture_id,  presence: true
  validates :city,           presence: true
  validates :address,        presence: true

end
