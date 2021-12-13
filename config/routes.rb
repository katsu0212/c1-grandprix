Rails.application.routes.draw do
  devise_for :users
  root to: "ranks#index"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  post 'dislike/:id' => 'dislikes#create', as: 'create_dislike'
  delete 'dislike/:id' => 'dislikes#destroy', as: 'destroy_dislike'
  resources :ranks
  resources :users 
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :dislikes, only: [:create, :destroy]
  end
end
