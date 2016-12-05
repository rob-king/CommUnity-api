Rails.application.routes.draw do

  resources :products, only: [:create, :index, :show, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end
end
