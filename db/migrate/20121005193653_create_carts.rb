class CreateCarts < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|

      t.timestamps
    end
  end
end
