class CreateMealItems < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_items do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
