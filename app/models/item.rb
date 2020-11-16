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

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :days_id
  validates :prefecture_id
  validates :product_id
  validates :shipping_id
  end

  validates :price, presence: true,numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
