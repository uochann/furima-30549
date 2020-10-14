class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_one_attached :image

  validates :name, :introduction, :price, :condition, :category, :postage_type, :preparation_day, :prefecture, presence: true
  validates :condition_id, :category_id, :postage_type_id, :preparation_day_id, :prefecture_id, numericality: { other_than: 1 }
end
