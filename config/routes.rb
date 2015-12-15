Rails.application.routes.draw do
  devise_for :staffers
  root 'welcome#index'

  namespace :admin do
    root 'welcome#index'
    resources :articles
    resources :areas
    resources :shops
    resources :categories
    resources :products
  end
end
