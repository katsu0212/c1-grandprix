Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  post 'smilee/:id' => 'smiles#create', as: 'create_smile'
  delete 'smile/:id' => 'smiles#destroy', as: 'destroy_smile'
  resources :ranks, only: [:index]
  resources :users 
  resources :titles do
    resources :smiles, only: [:create, :destroy]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
