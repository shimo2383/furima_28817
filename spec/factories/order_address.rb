FactoryBot.define do
  factory :order_address do
    token               { 'abc123' }
    user_id             { rand(1..5) }
    item_id             { rand(1..5) }
    postcode_id         { '000-0000' }
    shipping_region_id  { rand(2..48) }
    city                { '浦添市' }
    address             { '伊祖1-1-1' }
    building_name       { 'かりゆしビル10F' }
    phone_number        { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end
