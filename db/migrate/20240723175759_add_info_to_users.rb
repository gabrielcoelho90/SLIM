class AddInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :birth, :datetime
    add_column :users, :gender, :string
    add_column :users, :name, :string
  end
end
