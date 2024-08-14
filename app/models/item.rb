class Item < ApplicationRecord
  has_many :meal_items
  has_many :meals, through: :meal_items
end
