FactoryBot.define do
  factory :shipping_order do
    postal_code { '111-1111' }
    prefecture_id { 3 }
    city { '横浜' }
    address { '1-1' }
    phone_number{'09000000000'}
    building_name { '' }
    card_token{'aaa'}

  end
end
