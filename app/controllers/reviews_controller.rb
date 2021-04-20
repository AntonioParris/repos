class ReviewsController < ApplicationController
def create
    @article = Article.find(params[:article_id])
    @review = @article.reviews.create(review_params)
    redirect_to article_path(@article)
  end

  private
    def review_params
      params.require(:review).permit(:user, :body)
    end
end