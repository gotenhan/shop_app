class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_buyer

  private 

  def assign_buyer
    @current_buyer = Buyer.find_by_id(cookies[:user_id]) if cookies[:user_id].present?
    @current_buyer ||= new_buyer
    cookies.delete :user_id if @current_buyer.blank?
  end

  def new_buyer
    new_buyer = Buyer.new
    new_buyer.save

    cookies[:user_id] = new_buyer.id
    @current_buyer = new_buyer
  end
end
