class Admin::NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.all
  end

  def show
    @news_article = NewsArticle.find(params[:id])
  end

  def new
    @news_article = NewsArticle.new
  end

  def create
    @news_article = NewsArticle.create(news_article_params)
    if @news_article.save
      redirect_to admin_news_articles_path, notice: "The news article was successfully added"
    else
      flash[:alert] = @news_article.errors.full_messages.join(' ')
      render :new
    end
  end

  private

  def news_article_params
    params.required(:news_article).permit(:title, :body, :link)
  end
end
