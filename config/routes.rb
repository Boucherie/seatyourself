Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'restaurants#index'

  resources :restaurants
    resources :reservations

  post 'users' => 'users#create'
  get 'users/new' => 'users#new'

  post 'sessions' => 'sessions#create'
  get 'sessions/new' => 'sessions#new'

  delete 'sessions' => 'sessions#destroy'
end
