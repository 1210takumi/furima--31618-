class Card < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable


  has_one :card, dependent: :destroy
end
