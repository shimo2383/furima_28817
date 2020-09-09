FactoryBot.define do
  factory :item do
    category_id            { 2 }
    product_status_id      { 2 }
    shipping_charges_id    { 2 }
    shipping_region_id     { 2 }
    shipping_date_id       { 2 }
    item                   { 'coffee' }
    price                  { 500 }
    description            { '黒い飲み物' }
    association :user
  end
end
