class Admin::BuyersController < Admin::AdminController
  respond_to :html

  def index
    @buyers = Buyer.all
    respond_with 'admin/buyers'
  end

  def show
    @buyer = Buyer.find(params[:id])
    respond_with 'admin/buyers'
  end

  def destroy
    @buyer = Buyer.find(params[:id])
    @buyer.destroy if @buyer.present?
    redirect_to action: 'index'
  end
end
