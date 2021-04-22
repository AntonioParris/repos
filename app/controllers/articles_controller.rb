class ArticlesController < ApplicationController
  ARTICLES_PER_PAGE = 2
  def index
    if((params.fetch(:page, 0).to_i)<0)
     @page = 0.to_i
   else
     @page = params.fetch(:page, 0).to_i
    end
    @articles = Article.offset(@page*ARTICLES_PER_PAGE).limit(ARTICLES_PER_PAGE)
  end
  def show
    @article = Article.find(params[:id])
  end
    def new
    @article = Article.new
end
   def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
      end
  end

    def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :author)
    end

end