class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_items, dependent: :destroy
  has_many :items, through: :meal_items

  accepts_nested_attributes_for :meal_items, allow_destroy: true

  #The method filter meals of the current date
  def self.meals_of_the_day(user)
    user_meals = user.meals
    today = Time.zone.now.to_date
    user_meals.select {|user_meal| user_meal.date.to_date == today}
  end

end
