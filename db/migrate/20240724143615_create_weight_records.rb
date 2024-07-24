class CreateWeightRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :weight_records do |t|
      t.datetime :date
      t.references :users, null: false, foreign_key: true
      t.float :weight

      t.timestamps
    end
  end
end
