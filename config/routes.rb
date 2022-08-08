Rails.application.routes.draw do
  resources :image_files
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  
  get 'show2', to: 'bokes#show2'
  
  get 'profiles', to: 'profiles#index'
  delete 'delete', to: 'bokes#destroy', as: 'delete'
  
  resources :messages, :bokes, :tiktokers
end
