class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(id: :desc)
  end

  def show
    if params[:id].to_i != 0
      @products = Product.where(category_id: params[:id])
    else
      @products = Product.all
    end
    if params[:search].present?
      @products = @products.where('title like ?', "%#{params[:search]}%")
    end
  end
end
