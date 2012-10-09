class LineItem < ActiveRecord::Base
  attr_accessible :item, :item_id, :id, :updated_at, :cart_id, :created_at
  belongs_to :item
  belongs_to :wishlist
end
