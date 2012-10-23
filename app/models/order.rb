class Order < ActiveRecord::Base
  attr_accessible :confirmed, :buyer_id

  has_many :order_items
  belongs_to :buyer
end
