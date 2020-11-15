class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :email
         validates :birthday
         end

         validates :nickname, presence: true, length: { maximum: 40 }
         validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
         validates :last_name, :first_name , format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}

         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
         validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
            message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります" }
         
        

         has_many :items
         has_many :purchases
end

# user.rbで各バリデーションのエラーメッセージを設定している
# →エラーメッセージを変更したかったら、user.rbを見にいく