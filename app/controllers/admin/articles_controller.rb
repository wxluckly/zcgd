class Admin::ArticlesController < Admin::ApplicationController

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    flash[:notice] = 'success' if @article.update_attributes(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @articles = Article.where(id: params["ids"] || [params[:id]])
    flash[:notice] = "Article successfully destroyed" if Article.destroy(@articles.collect(&:id))
    respond_to do |format|
      format.html { redirect_to admin_articles_path}
      format.json { render json: {status: true}.to_json }
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :material, :standard, :circulation, :desc, :image)
  end
end
