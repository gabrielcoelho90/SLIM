class AddMetricToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :metric, :string
  end
end
