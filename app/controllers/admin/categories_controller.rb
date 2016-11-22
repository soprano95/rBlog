class Admin::CategoriesController < Admin::ApplicationController
  def new
    @page_title = 'Add category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'category created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
    flash[:notice] = "Category Updated"
    redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:notice] = 'category Removed'
      redirect_to admin_categories_path
  end

  def index
    if params[:search]
        @categories = Category.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      else
        @categories = Category.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      end 
  end

  def show
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
