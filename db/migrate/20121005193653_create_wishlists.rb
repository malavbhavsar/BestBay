class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|

      t.integer :user_id
      t.timestamps
    end
  end
end
