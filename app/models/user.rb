class User < ApplicationRecord
  has_many :user_sports
  has_many :sports, through: :user_sports
  has_many :weight_records

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
