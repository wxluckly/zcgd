class Admin::ShopsController < Admin::ApplicationController

  def index
    @shops = Shop.paginate(page: params[:page])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to admin_shops_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    flash[:notice] = 'success' if @shop.update_attributes(shop_params)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to admin_shops_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @shops = Shop.where(id: params["ids"] || [params[:id]])
    flash[:notice] = "Shop successfully destroyed" if Shop.destroy(@shops.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_shops_path}
      format.json { render json: {status: true}.to_json }
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:mobile, :address, :area_id)
  end
end
