Rails.application.routes.draw do

resources :products do
  resources :comments
end
  root "products#index"
end
