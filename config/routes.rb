Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do

  	resources :book_comments, only: [:create, :destroy]

  	resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update]

  resources :homes, only: [:top, :about]

  get "home/about" => "homes#about"

end
