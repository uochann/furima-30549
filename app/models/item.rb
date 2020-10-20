class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :condition
    validates :category
    validates :postage_type
    validates :preparation_day
    validates :prefecture
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :category_id
    validates :postage_type_id
    validates :preparation_day_id
    validates :prefecture_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }
end
