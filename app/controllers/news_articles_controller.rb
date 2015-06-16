class NewsArticlesController < ApplicationController
  def index
    @articles = NewsArticle.all.order(date: :desc)
  end

  def show
    @article = NewsArticle.friendly.find(params[:id])
  end  
end
