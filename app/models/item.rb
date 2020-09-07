class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :category_id
    validates :product_status_id
    validates :shipping_charges_id
    validates :shipping_region_id
    validates :shipping_date_id
    validates :item
    validates :price
  end

end
