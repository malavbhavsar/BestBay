class LineItem < ActiveRecord::Base
  attr_accessible :item, :item_id, :id, :updated_at, :wishlist_id
  belongs_to :item
  belongs_to :wishlist

end
