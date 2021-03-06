Rails.application.routes.draw do
  devise_for :users
  root to: 'equipment#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :equipment do
    resources :bookings, only: [:create]
    resources :reviews
  end

  resources :bookings, only: [:index, :update, :destroy]

  # you will see the result of your search for a particular equipment
  resources :search_results, only: :index

  get '/profile', to: 'profiles#show'
  get '/profile/edit', to: 'profiles#edit', as: "user"

  patch '/profile/:id', to: 'profiles#update'
end
