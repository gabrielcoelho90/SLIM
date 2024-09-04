class AddColumnQtdToMealItem < ActiveRecord::Migration[7.1]
  def change
    add_column :meal_items, :qty, :float
  end
end
