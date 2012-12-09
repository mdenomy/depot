Depot::Application.routes.draw do

  resources :line_items, only: [:create, :destroy]

  resources :store, only: [:index, :destroy]

  root to: 'store#index'

  resources :carts, only: [:create, :destroy]

  resources :products, only: [:create, :destroy]

end
