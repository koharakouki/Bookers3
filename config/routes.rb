Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create]
  end
  resources :book_comments, only: [:destroy]
  root 'home#top'
  get 'home/about', to: 'home#about'
end