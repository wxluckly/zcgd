class AreasController < ApplicationController
  def index
    @areas = Area.select{ |node| node.is_root? }
  end

  def show
    @shops = Shop.where(area_id: params[:id])
  end
end
