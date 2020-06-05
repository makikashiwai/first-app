class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable

  validates :first_name,                   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+$\z/ }
  validates :last_name,                    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+$\z/ }
  validates :firstname_kana,               presence: true, format: { with: /\A([ァ-ン]|ー)+$\z/ }
  validates :lastname_kana,                presence: true, format: { with: /\A([ァ-ン]|ー)+$\z/ }
  validates :birthdate_day,                presence: true
  validates :email,                        presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/ }
  validates :password,                     presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}+\z/i }
  validates :password_confirmation,        presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}+\z/i }

  has_one :address
end
