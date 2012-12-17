Depot::Application.routes.draw do

  root to: 'store#index'

  resources :line_items, only: [:index, :create, :destroy]

  resources :store, only: [:index, :destroy]

  resources :carts, only: [:create, :destroy]

  resources :products, only: [:create, :destroy]

end
