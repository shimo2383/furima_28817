class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_date

  # 空の投稿を保存できないようにする
  # validates :title, :integer, :category_id, presence: true

  with_options presence: true do
    validates :user_id
    validates :category_id
    validates :product_status_id
    validates :shipping_charges_id
    validates :shipping_region_id
    validates :shipping_date_id
    validates :item
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :description
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # greater_than_or_equal_to: 〇〇 / 〇〇と同じか、それ以上の数値
  # less_than_or_equal_to: △△  / △△と同じか、それ以下の数値
  # validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000 }

  # ジャンルの選択が「--」の時は保存できないようにする
  # validates :genre_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :shipping_region_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
end
