class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  validates :email,           presence: true,     uniqueness: { case_sensitive: :false }
  validates :password,        presence: true,     format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname,        presence: true
  validates :birthday,        presence: true
  validates :first_name,      presence: true,     format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,       presence: true,     format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true,     format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,  presence: true,     format: { with: /\A[ァ-ヶー－]+\z/ }
end
