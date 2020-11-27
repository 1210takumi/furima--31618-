require 'rails_helper'

RSpec.describe ShippingOrder, type: :model do
    describe '発送先の保存' do
      before do
      seller  = FactoryBot.create(:user)
      buyer = FactoryBot.create(:user)  
      product = FactoryBot.create(:item)
      @shipping_order = FactoryBot.build(:shipping_order)
      
      product.image = fixture_file_upload('public/apple-touch-icon.png',  'apple-touch-icon')

      end

      context '商品購入ができる時' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@shipping_order).to be_valid
        end  
        it 'building_nameは空でも保存できること' do
          @shipping_order.building_name = nil
          expect(@shipping_order).to be_valid
        end
      end
      
      context '商品購入ができない時' do
        it 'postal_codeが空だと保存できないこと' do
          @shipping_order.postal_code = nil
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shipping_order.postal_code = '1234567'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'prefectureを選択していないと保存できないこと' do
          @shipping_order.prefecture_id = 1
          @shipping_order.valid?
          expect(@shipping_order.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it 'phone_numberが空だと保存できないこと' do
          @shipping_order.phone_number = ""
          @shipping_order.valid?
          expect(@shipping_order.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'cityが空の場合購入できない' do
          @shipping_order.city = ""
          @shipping_order.valid?
          expect(@shipping_order.errors.full_messages).to include("City can't be blank")
        end

        it 'addressが空の場合購入できない' do
          @shipping_order.address = ""
          @shipping_order.valid?
          expect(@shipping_order.errors.full_messages).to include("Address can't be blank")
        end
        
        it  'tokenが空の場合購入できない' do
          @shipping_order.card_token = ""
          @shipping_order.valid?
          expect(@shipping_order.errors.full_messages).to include("Card token can't be blank")
        end
        
        it 'phone_numberが11桁以内' do
          @shipping_order.phone_number = '090000000000000'
          @shipping_order.valid?
          expect(@shipping_order.errors.full_messages).to include("Phone number Too long")
        end
      end
    end
  end

