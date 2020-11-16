class Item < ApplicationRecord
  with_options presence: true do
  validates :title
  validates :text
  # validates :category_id
  # validates :shipping_id 
  # validates :prefecture_id
  # validates :days_id
  validates :price
  # validates :user
  end

  has_one_attached :image
  # has_one :purchase
  belongs_to :user

  validates :category_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :product_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :price, presence: true,numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
