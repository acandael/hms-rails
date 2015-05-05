class NewsArticlesController < ApplicationController
  def index
    @articles = NewsArticle.all
  end

  def show
    @article = NewsArticle.find(params[:id])
  end  
end
