class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
  validates :title
  validates :text
  validates :price
  end

  has_one_attached :image
  
  belongs_to :user
  belongs_to :category
  belongs_to :days
  belongs_to :prefecture
  belongs_to :product
  belongs_to :shipping

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :days_id
  validates :prefecture_id
  validates :product_id
  validates :shipping_id
  end
  
  def was_attached?
    self.image.attached?
  end

  validates :price, presence: true,numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
