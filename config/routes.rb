Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :users 
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
