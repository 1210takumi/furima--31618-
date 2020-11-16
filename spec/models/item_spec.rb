require 'rails_helper'

RSpec.describe Item, type: :model do

  describe Item do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      # @item.image = fixture_file_upload('/sample.jpeg', 'image/png')
      # @item.image = 
      # category = create(:category)
      # item = FactoryBot.build(:item, seller_id: user[:id], category_id: category[:id])
    end

    describe '#create' do
      it "全ての条件を入力すると登録ができる" do
        expect(@item.valid?).to eq true
        # binding.pry
        # expect(item).to be_valid
      end
  
      it "商品名がなければ登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
        # expect(item.errors[:name]).to include("入力してください")
      end
      #   通常の記述はinclude("can't be blank"")だが、
      #   models.item.rbのバリデーションで
      #   "入力してください"と空投稿で表示されるように変更している為、
      #   include("入力してください")で記載。
  
      it "価格がなければ登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it "商品の説明がなければ登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
  
      it "カテゴリーがなければ登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
  
      it "商品の状態がなければ登録できない" do
        @item.product_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product must be other than 1")
      end
  
      it "配送料の負担がなければ登録できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
  
      it "発送元の地域がなければ登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
  
      it "発送までの日数がなければ登録できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end

      it "価格が下限以下" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      
      end

      it "価格が上限以上" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end


    end
  end
end
