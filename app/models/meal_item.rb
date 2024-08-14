class MealItem < ApplicationRecord
  belongs_to :meal
  belongs_to :item
end
