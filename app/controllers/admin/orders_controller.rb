class Admin::OrdersController < ApplicationController
  respond_to :html

  def index
    @orders = Order.all
    respond_with 'admin/orders'
  end

  def show
    @order = Order.find(params[:id])
    respond_with 'admin/orders'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy if @order.present?
    redirect_to action: 'index'
  end
end
