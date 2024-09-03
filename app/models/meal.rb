class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_items
  has_many :items, through: :meal_items

  accepts_nested_attributes_for :meal_items, allow_destroy: true
end
