class Buyer < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  has_many :orders

  def active_order
    new_order if orders.blank? || orders.last.confirmed
    orders.last
  end
  
  def new_order
    orders << Order.create(buyer_id: id)
  end

end
