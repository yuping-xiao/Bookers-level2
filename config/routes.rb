Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

end
