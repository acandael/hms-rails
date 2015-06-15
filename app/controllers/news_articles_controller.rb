class NewsArticlesController < ApplicationController
  def index
    @articles = NewsArticle.all
  end

  def show
    @article = NewsArticle.friendly.find(params[:id])
  end  
end
