class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if params[:id].to_i != 0
      @products = Product.where(category_id: params[:id])
    else
      @products = Product.all
    end
  end
end
