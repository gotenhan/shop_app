class Admin::PhonesController < Admin::AdminController
  respond_to :html

  def index
    @phones = Phone.all
    respond_with 'phones' 
  end
end
