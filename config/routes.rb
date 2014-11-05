Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  # capture GET '/pokemon/:trainer_id', to: 'pokemon#capture'
  patch '/capture', to: 'pokemon#capture', as: "capture"

  patch '/damage', to: 'pokemon#damage', as: "damage"

  post '/pokemon', to: 'pokemon#create'

  get '/pokemon/new', to: 'pokemon#new', as: 'pokemon_new'
end
