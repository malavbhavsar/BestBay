class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :wishlist_id
      t.integer :quantity, :default => 1
      t.timestamps
    end
  end
end
