class Order < ActiveRecord::Base
  attr_accessible :confirmed, :buyer_id

  has_many :order_items
  belongs_to :buyer

  def total_price
    order_items.inject(0.0) { |total_price, order_item| total_price + order_item.price }
  end
end
