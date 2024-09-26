class RenameTypeColumnInMeals < ActiveRecord::Migration[7.1]
  def change
    rename_column :meals, :type, :meal_type
  end
end
