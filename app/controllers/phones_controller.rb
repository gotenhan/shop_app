class PhonesController < ApplicationController
  before_filter :remove_empty_search_categories, only: [:index]
  respond_to :html

  def index
    @search = Phone.search(params[:q]) 
    @phones  = @search.result(distinct: true)

    respond_with :phones
  end

  def show
    @phone = Phone.find(params[:id])
    respond_with :phone
  end

  def remove_empty_search_categories 
    if params[:q] && params[:q][:categories_id_in]
      params[:q][:categories_id_in].reject!(&:blank?)
    end
  end
end
