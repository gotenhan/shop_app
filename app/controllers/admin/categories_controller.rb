class Admin::CategoriesController < Admin::AdminController
  respond_to :html

  def index
    @categories = Category.all
    respond_with 'categories' 
  end

  def new
    @categories = Category.all
    @category = Category.new
    respond_with 'categories'
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
    respond_with 'categories'
  end

  def show
    @category = Category.find(params[:id])
    respond_with 'categories'
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to action: 'index'
    else
      @categories = Category.all
      render action: 'new'
    end
  end

  def update
    @category = Category.find_by_id(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to action: 'index'
    else
      @categories = Category.all
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy
    redirect_to action: 'index'
  end
end
