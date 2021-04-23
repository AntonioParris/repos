class ArticlesController < ApplicationController
  ARTICLES_PER_PAGE = 2
  def index
    if((params.fetch(:page, 0).to_i)<0) #page wont go below -1 =0
     @page = 0.to_i
   else if((params.fetch(:page, 0).to_i)>((Article.all.try(:length) || 0)/2)) #page wont go higer than max+1
     @page = ((Article.all.try(:length) || 0).to_i)/2
   else
    @page = params.fetch(:page, 0).to_i
    end
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