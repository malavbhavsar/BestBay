class AddTrackedColumnToBidsTable < ActiveRecord::Migration
  def change
    add_column :bids, :tracked, :boolean, :default => false
  end
end
