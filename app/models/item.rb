class Item < ApplicationRecord
  has_many :meal_items
  has_many :meals, through: :meal_items
  before_save :format_name

  private

  def format_name
    self.name = name.delete("-").split(" Per ").first.strip
  end
end
