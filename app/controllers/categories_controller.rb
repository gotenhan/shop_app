class CategoriesController < ApplicationController
  respond_to :html

  def index
    @categories = Category.all
    respond_with :categories
  end

  def show
    @category = Category.find(params[:id])
  end
end
