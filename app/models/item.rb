class Item < ActiveRecord::Base
  attr_accessible :name, :picture, :description, :opening_bid, :highest_bid
end
