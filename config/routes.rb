Rails.application.routes.draw do
  resources :reports
  resources :users, only: [:create, :new, :show, :update, :edit]
  get 'login' => "users#new" 
  resources :reports, only: [:new, :create, :index, :show, :edit]
  get 'research' => "reports#index"
  
  root 'home_pages#index'
end