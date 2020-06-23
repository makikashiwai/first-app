class Product < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_presence_of :images
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
  
  # validate :images_presence
  # validates :name, :text, :category_id, :condition_id, :deliverycost_id, :pref_id, :delivery_days_id, :boughtflg_id,:user_id, presence: true
  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

#imageのバリデーション
  def images_presence
    if images.attached?
      # inputに保持されているimagesがあるかを確認
      if images.length > 10
        errors.add(:image, '10枚まで投稿できます')
      end
    else
      errors.add(:image, '画像がありません')
    end
  end
end
