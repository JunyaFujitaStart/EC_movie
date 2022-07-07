Rails.application.routes.draw do
  resources :image_files
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  
  resources :messages
  resources :bokes
  resources :tiktokers
end
