class Admin::CategoriesController < Admin::ApplicationController

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    flash[:notice] = 'success' if @category.update_attributes(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @categories = Category.where(id: params["ids"] || [params[:id]])
    flash[:notice] = "Category successfully destroyed" if Category.destroy(@categories.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_categories_path}
      format.json { render json: {status: true}.to_json }
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
