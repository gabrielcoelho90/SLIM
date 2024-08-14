class Meal < ApplicationRecord
  belongs_to :user
  has_may :meal_items
  has_many :items, through: :meal_items
end
