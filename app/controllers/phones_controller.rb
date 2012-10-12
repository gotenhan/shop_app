class PhonesController < ApplicationController
  respond_to :html

  def index
    @phones = Phone.all
    respond_with :phones
  end

  def show
    @phone = Phone.find(params[:id])
    respond_with :phone
  end
end
