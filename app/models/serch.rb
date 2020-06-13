class Serch < ApplicationRecord

  enum buyer: { sell: 0, buy: 1}
  scope :on_sell, -> { where(buyer: 0) }
  
end