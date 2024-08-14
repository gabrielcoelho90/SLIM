class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :calories
      t.float :fat
      t.float :protein
      t.float :carbs

      t.timestamps
    end
  end
end
