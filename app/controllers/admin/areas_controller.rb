class Admin::AreasController < Admin::ApplicationController

  def index
    @areas = Area.select{ |node| node.is_root? }
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    respond_to do |format|
      if @area.save
        format.html { redirect_to admin_areas_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    flash[:notice] = 'success' if @area.update_attributes(area_params)
    respond_to do |format|
      if @area.save
        format.html { redirect_to admin_areas_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @areas = Area.where(id: params["ids"] || [params[:id]])
    flash[:notice] = "Area successfully destroyed" if Area.destroy(@areas.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_areas_path}
      format.json { render json: {status: true}.to_json }
    end
  end

  private
  def area_params
    params.require(:area).permit(:name, :parent_id)
  end
end
