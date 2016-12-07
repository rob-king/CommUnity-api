Rails.application.routes.draw do

  resources :products, only: [:create, :index, :show, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
    get '/tags', to: 'tags#index'
    post '/tags', to: 'tags#create'
    put '/tags', to: 'tags#update'
  end
  get '/categories', to: 'categories#index'
end
