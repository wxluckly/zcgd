class Admin::ProductsController < Admin::ApplicationController

  def index
    @products = Product.paginate(page: params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    flash[:notice] = 'success' if @product.update_attributes(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @products = Product.where(id: params["ids"] || [params[:id]])
    flash[:notice] = "Product successfully destroyed" if Product.destroy(@products.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_products_path}
      format.json { render json: {status: true}.to_json }
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :material, :standard, :circulation, :desc, :image, :category_id)
  end
end
