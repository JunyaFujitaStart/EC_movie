Rails.application.routes.draw do
  resources :image_files
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  
  get 'show2', to: 'bokes#show2'
  
  resources :messages
  resources :bokes
  resources :tiktokers
end
