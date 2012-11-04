class DeleteColumnHighestBidFromItemTable < ActiveRecord::Migration
  def change
    remove_column :items, :highest_bid
  end
end
