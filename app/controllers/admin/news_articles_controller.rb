class Admin::NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.all
  end
end
