Rails.application.routes.draw do
  get '/login' => "users#new" , as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/user/:id' => 'users#show', as: :show_profile
  get '/user/:id' => 'users#edit', as: :edit_profile
  resources :users, only: [:create, :update]
  
  get 'research' => "reports#index"
  resources :reports, only: [:new, :create, :show, :edit]
  
  get 'index' => 'home_pages#index', as: :home
  root 'home_pages#index'
end