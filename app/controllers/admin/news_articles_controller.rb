class Admin::NewsArticlesController < DashboardController
  before_action :find_news_article, only: [:show, :edit, :update, :destroy]
  def index
    @news_articles = NewsArticle.all.order(:created_at)
  end

  def show
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

  def edit
  end

  def update
    if @news_article.update(news_article_params)
      redirect_to admin_news_articles_path, notice: 'News article successfully updated'
    else
      flash[:alert] = @news_article.errors.full_messages.join(' ')
      render :edit
    end
  end
  def destroy
    @news_article.destroy
    redirect_to admin_news_articles_path, notice: "News article successfully deleted"
  end

  private
  
  def find_news_article
    @news_article = NewsArticle.friendly.find(params[:id])
  end

  def news_article_params
    params.required(:news_article).permit(:date, :title, :slug, :body, :image, :image_cache_id, :remove_image, :document, :remove_document, :link)
  end
end
