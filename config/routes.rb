Rails.application.routes.draw do
  root "homes#index"
  get 'mission', to: 'pages#mission'
  get 'news', to: 'news_articles#index', as: 'news_articles'
  get 'news/:id', to: 'news_articles#show', as: 'news_article'
  get 'admin', to: 'dashboard#index'
  get 'people', to: 'members#index', as: 'people'
  get 'member/:id', to: 'members#show', as: 'member'
  get 'themes', to: 'themes#index', as: 'themes'
  get 'theme/:id', to: 'themes#show', as: 'theme'
  get 'publications', to: 'publications#index', as: 'output'
  get 'publications/:category', to: 'publications#sort', as: 'publications'
  get 'publication/:id', to: 'publications#show', as: 'publication'
  get 'contact', to: 'pages#contact'
  get 'nederlands', to: 'pages#nederlands'
  get 'disclaimer', to: 'pages#disclaimer'
  get 'signin', to: 'sessions#new'

  resource :session

  namespace :admin do
    resources :news_articles
    resources :members do
      collection { post :sort }
    end
    resources :publications
    resources :themes
  end
end
