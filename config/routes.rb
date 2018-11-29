Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :articles do
    resources :comments
  end

  namespace :admin do
    resources :categories, only: [:index]
  end

  resources :tags
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
