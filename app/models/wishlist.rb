class Wishlist < ActiveRecord::Base

  validates :name, :uniqueness => { :scope => :user_id, :message => "already exists." }
  validates :name, :presence => true

  has_many :line_items, dependent: :destroy
  belongs_to :user
  attr_accessible :name

  def add_product(item_id)
    line_item = line_items.find_by_item_id(item_id)
    if line_item.nil?
      line_item = line_items.create(item_id: item_id)
    end
  end

  def total_price
    line_items.to_a.sum { |litem| litem.item.highest_bid }
  end

end
