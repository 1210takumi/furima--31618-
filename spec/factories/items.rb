FactoryBot.define do
  factory :item do
    title {"孫悟空"}
    text{"sample"}
    category_id {2}
    product_id {2}
    shipping_id{2}
    prefecture_id{2}
    days_id{2}
    price {1000}

    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon')
    end

  end
end
