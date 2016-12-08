Rails.application.routes.draw do

  resources :producrts, only: [:create, :index, :show, :update, :destroy] do
    resources :comments, only: [:create, :update, :destroy]
  end
end
