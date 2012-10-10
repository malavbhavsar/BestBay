class LineItem < ActiveRecord::Base
  attr_accessible :item, :item_id, :id, :updated_at, :wishlist_id, :created_at, :quantity
  belongs_to :item
  belongs_to :wishlist

  def total_price
    item.highest_bid * quantity
  end

end
