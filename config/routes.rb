Rails.application.routes.draw do
  root "homes#index"
  get 'admin', to: 'dashboard#index'

  namespace :admin do
    resources :news_articles
  end
end
