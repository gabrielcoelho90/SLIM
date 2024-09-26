class MealItem < ApplicationRecord
  enum measure_unit: {grams: 0, pieces: 1, milliliters: 2, cup: 3, un: 4}

  belongs_to :meal
  belongs_to :item

  accepts_nested_attributes_for :item, allow_destroy: true
  delegate :name, :calories, :fat, :protein, :carbs, to: :item
end
