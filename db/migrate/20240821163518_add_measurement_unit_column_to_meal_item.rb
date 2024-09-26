class AddMeasurementUnitColumnToMealItem < ActiveRecord::Migration[7.1]
  def change
    add_column :meal_items, :measure_unit, :integer, default: 0, null: false
  end
end
