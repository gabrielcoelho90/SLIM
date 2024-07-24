class AddKilosToLoseAndTimelineToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kilos_to_lose, :float
    add_column :users, :timeline, :datetime
  end
end
