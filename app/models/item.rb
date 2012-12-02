class Item < ActiveRecord::Base

  include Redis::Search

  attr_accessible :name, :user_id, :picture, :description, :opening_bid, :highest_bid, :closing_date, :closing_day, :closing_time, :category

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  belongs_to :user

  has_many :bids
  has_many :users, :through => :bids

  validates :name, :presence => true
  validates :opening_bid, :presence => true
  validates :opening_bid, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ ,:message => " is invalid."}
  validates :opening_bid, :numericality => {:greater_than => 0.01, :message => " should be greater than 0.01"}


  redis_search_index(:title_field => :name,
                     :alias_field => :name,
                     :prefix_index_enable => true,
                     :score_field => :highest_bid,
                     :ext_fields => [:id,:user_id,:picture,:description,:closing_date])

  def closing_date
    DateTime.parse(self.closing_day.to_s + "T" + self.closing_time.to_s.split(" ")[1,2].join(" "))
  end

  def highest_bid
    if self.bids.empty?
      self.opening_bid
    else
      self.bids.all(:order => "amount DESC").first.amount
    end
  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
