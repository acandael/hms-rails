class HomesController < ApplicationController
  def index
    @articles = NewsArticle.order(created_at: :desc).limit(2)
    @themes = Theme.all.order(title: :asc)
  end
end
