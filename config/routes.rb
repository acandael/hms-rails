Rails.application.routes.draw do
  root "homes#index"
  get 'news', to: 'news_articles#index', as: 'news_articles'
  get 'news/:id', to: 'news_articles#show', as: 'news_article'
  get 'admin', to: 'dashboard#index'

  namespace :admin do
    resources :news_articles
  end
end
