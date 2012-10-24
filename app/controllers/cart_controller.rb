#encoding: utf-8

class CartController < ApplicationController
  respond_to :html

  def show
    @order = Order.find_by_id(@current_buyer.active_order)
    respond_with 'cart/show'
  end

  def add
    current_order = @current_buyer.active_order
    ordered_item = current_order.order_items.find_by_phone_id(params[:id])
    ordered_item = new_order_item(current_order, params[:id]) if ordered_item.blank?

    ordered_item.quantity += 1
    ordered_item.price += ordered_item.phone.price
    ordered_item.save
    current_order.save
    redirect_to :back, notice: 'Dodano do koszyka'
  rescue ActionController::RedirectBackError
    redirect_to phones_path, notice: 'Dodano do koszyka'
  end

  def remove
    current_order = @current_buyer.active_order
    ordered_item = current_order.order_items.find_by_phone_id(params[:id])
  
    if ordered_item.present?
      items_left = ordered_item.quantity -= 1
      ordered_item.price -= ordered_item.phone.price
      if ordered_item.quantity == 0
        ordered_item.destroy
      else
        ordered_item.save
      end
    end
    current_order.save
    redirect_to :back, notice: "Usunięto z koszyka. Pozostało sztuk: #{items_left}"
  rescue ActionController::RedirectBackError
    redirect_to phones_path, notice: 'Dodano do koszyka'
  end

  def confirm
    @current_buyer.active_order.confirmed = true
    @current_buyer.active_order.save
    @current_buyer.new_order
    redirect_to phones_path
  end

  private

  def new_order_item(current_order, phone_id)
    oi = OrderItem.create(order_id: current_order.id, phone_id: phone_id)
    current_order.order_items << oi
    oi
  end
end
