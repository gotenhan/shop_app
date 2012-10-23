class OrderItem < ActiveRecord::Base
  attr_accessible :quantity, :phone_id, :order_id

  belongs_to :phone
  belongs_to :order
end
