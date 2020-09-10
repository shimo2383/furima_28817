class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :user_id
    validates :item
    validates :description
    validates :category_id,               numericality: { other_than: 1 }
    validates :product_status_id,         numericality: { other_than: 1 }
    validates :shipping_charges_id,       numericality: { other_than: 1 }
    validates :shipping_region_id,        numericality: { other_than: 1 }
    validates :shipping_date_id,          numericality: { other_than: 1 }
    validates :price,                     numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
end