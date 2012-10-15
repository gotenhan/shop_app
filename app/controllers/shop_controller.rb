class ShopController < ApplicationController
  respond_to :html

  def index
    @categories = Category.all
    respond_with :categories
  end
end
