class Bid < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :amount
  belongs_to :user
  belongs_to :item
end
