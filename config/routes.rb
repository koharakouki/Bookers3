Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
  	member do
  		get :following, :followers
  	end
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about', to: 'home#about'
  resources :relationships, only: [:create, :destroy]
  get '/search', to: 'search#search'

  get '/books/:book_id/book_comments', to: 'book_comments#create'

  resources :chats, only: [:create, :show]
end