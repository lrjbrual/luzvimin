Rails.application.routes.draw do
  root to: 'posts#index'
  get 'contact' => 'contacts#new'
  get 'contacts/create'
  get 'about' => 'about#index'
  get 'posts/show'

  namespace :admin do
    get '/login' => 'sessions#new', :as => 'login'
  end

  namespace :admin do
    get '/logout' => 'sessions#destroy', :as => 'logout'
  end

  resources :posts, :categories
  resources 'contacts', only: [:new, :create]
  namespace :admin do
    resources :posts, :categories, :users, :sessions
    resources :posts, param: :name
  end

end
