class Admin::BannersController < Admin::ApplicationController

  def index
    @banners = Banner.paginate(page: params[:page])
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    flash[:notice] = 'success' if @banner.update_attributes(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @banners = Banner.where(id: params["ids"] || [params[:id]])
    flash[:notice] = "Banner successfully destroyed" if Banner.destroy(@banners.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_banners_path}
      format.json { render json: {status: true}.to_json }
    end
  end

  private
  def banner_params
    params.require(:banner).permit(:image, :url)
  end
end
