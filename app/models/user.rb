class User < ApplicationRecord
  enum :metric, %i(days weeks months)

  has_many :user_sports, dependent: :destroy
  has_many :sports, through: :user_sports
  has_many :weight_records, dependent: :destroy
  has_many :meals, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :age, :weight, :height, :kilos_to_lose, :gender, :metric, :timeline,  presence: true, on: :update
end
