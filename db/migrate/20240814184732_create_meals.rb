class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :type
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
