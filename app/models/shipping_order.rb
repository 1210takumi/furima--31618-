class ShippingOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city ,:address, :building_name, :phone_number, :user_id, :item_id, :card_token
  with_options presence: true do
  validates :postal_code 
  validates :prefecture_id 
  validates :city 
  validates :address 
  validates :phone_number
 
  end
    
      def save
        # ユーザーの情報を保存し、「user」という変数に入れている
        # 住所の情報を保存
        purchase = Purchase.create(item_id: item_id, user_id: user_id)
        ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building_name: building_name, purchase_id: purchase.id)
        # 寄付金の情報を保存
        
      end
      # 各テーブルにデータを保存する処理を書く
end