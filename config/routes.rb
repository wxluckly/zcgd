Rails.application.routes.draw do
  devise_for :staffers, controllers: { sessions: 'staffers/sessions', registrations: 'staffers/registrations' }
  root 'welcome#index'
  resources :articles
  resources :areas
  resources :categories
  resources :products
  namespace :sub do
    get :company, :company_intro, :company_aboutus, :price
  end
  namespace :admin do
    root 'welcome#index'
    resources :articles
    resources :areas do
      collection do
        put "move"
      end
    end
    resources :shops
    resources :categories
    resources :products
  end
end
