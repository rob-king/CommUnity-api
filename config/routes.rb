Rails.application.routes.draw do

resources :products, only: [:index, :show, :create, :new, :edit, :destroy] do
resources :comments, only: [:show, :new, :create, :create, :edit, :destroy]
end
  root "products#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
