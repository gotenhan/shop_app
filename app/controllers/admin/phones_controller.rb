class Admin::PhonesController < Admin::AdminController
  respond_to :html

  def index
    @phones = Phone.all
    respond_with 'phones' 
  end

  def new
    @categories = Category.all
    @phone = Phone.new
    respond_with 'phones'
  end

  def edit
    @categories = Category.all
    @phone = Phone.find(params[:id])
    respond_with 'phones'
  end

  def show
    @phone = Phone.find(params[:id])
    respond_with 'phones'
  end

  def create
    @phone = Phone.new(params[:phone])
    if @phone.save
      redirect_to action: 'index'
    else
      @categories = Category.all
      render action: 'new'
    end
  end

  def update
    @phone = Phone.find_by_id(params[:id])
    if @phone.update_attributes(params[:phone])
      redirect_to action: 'index'
    else
      @categories = Category.all
      render :action => 'edit'
    end
  end

  def destroy
    @phone = Phone.find_by_id(params[:id])
    @phone.destroy
    redirect_to action: 'index'
  end
end
