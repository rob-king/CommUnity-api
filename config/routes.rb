Rails.application.routes.draw do

resources :products do
  resources :comments, only: [:create, :update, :destroy]
end
  root "products#index"
end
