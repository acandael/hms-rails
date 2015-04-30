Rails.application.routes.draw do
  namespace :admin do
    resources :news_articles
  end
end
