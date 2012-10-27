class AddNameColumnToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :name, :string
  end
end
