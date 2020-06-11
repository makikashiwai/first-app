class Product < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  belongs_to :category
  has_one :store

  validates :name,           presence: true
  validates :price,          presence: true
  validates :introduction,   presence: true
  validates :shipping_cost,  presence: true
  validates :shipping_days,  presence: true
  validates :prefecture_id,  presence: true
  validates :user_id,        presence: true
  validates :category_id,    presence: true
  validates :store_id,    presence: true

  enum buyer: { sell: 0, buy: 1}
  scope :on_sell, -> { where(buyer: 0) }

  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end
  
end
