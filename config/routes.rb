Rails.application.routes.draw do

  resources :auctions do
    resources :bids
    resources :publishings, only: :create
    resources :meets_reserve, only: :create
    resources :watches, only: [:create, :destroy]
  end

  resources :sessions do
    delete :destroy, on: :collection
  end

  resources :users do
    resources :bids
    resources :watches, only: [:index]
  end

  root 'auctions#index'
end
