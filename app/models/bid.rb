class Bid < ActiveRecord::Base
  attr_accessible :user_id, :item_id, :amount, :tracked
  belongs_to :user
  belongs_to :item
  validates :amount, :presence => true
  validates :amount, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ ,:message => " is invalid."}
  validates :amount, :numericality => {:greater_than => 0.01, :message => " should be greater than 0.01"}
end
