module CartHelper
  def current_buyers_order?
    @current_buyer = @order.buyer_id
  end
end
