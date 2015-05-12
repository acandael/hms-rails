Rails.application.routes.draw do
  root "homes#index"
  get 'news', to: 'news_articles#index', as: 'news_articles'
  get 'news/:id', to: 'news_articles#show', as: 'news_article'
  get 'admin', to: 'dashboard#index'
  get 'people', to: 'members#index', as: 'people'
  get 'member/:id', to: 'members#show', as: 'member'
  get 'publications', to: 'publications#index', as: 'publications'
  get 'signin', to: 'sessions#new'

  resource :session

  namespace :admin do
    resources :news_articles
    resources :members
    resources :publications
    resources :themes
  end
end
