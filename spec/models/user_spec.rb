require 'rails_helper'

  RSpec.describe User, type: :model do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end
  
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
      end
  
      it "nameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが@が含まれないと登録できないこと" do
        @user.email = "sample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以上であれば登録できること" do
        @user.password = "Aa23456"
        @user.password_confirmation = "Aa23456"
        expect(@user).to be_valid
      end
    
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "last_nameが空だとユーザー登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end  

      it "first_nameが空だとユーザー登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it "last_name_kanaが空だとユーザー登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end

      it "first_name_kanaが空だとユーザー登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      
      describe '#katakana' do
        it "last_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない" do
          @user.last_name = "kana"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
        end

        it "first_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない" do
          @user.first_name = "kana"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
        end
        it "last_name_kanaが全角（カタカナ）以外だとユーザー登録できない" do
          @user.last_name_kana = "kana"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
        end
        it "first_name_kanaが全角（カタカナ）以外だとユーザー登録できない"do
          @user.first_name_kana = "kana"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
        end
      end
              
      it "birthdayが空だとユーザー登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
