class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postcode_id, :shipping_region_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postcode_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
    validates :shipping_region_id, numericality: { other_than: 1 }
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A\d{11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode_id: postcode_id, shipping_region_id: shipping_region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
