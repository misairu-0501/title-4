Rails.application.routes.draw do



  root to: 'homes#top'
  devise_for :users

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  #上記３行を下記1行に集約

  resources :post_images, only: [:new,:create, :index, :show, :destroy]

  # get 'users/show'
  # get 'users/edit'
  # 上記２行を下記１行に集約
  resources :users, only: [:show, :edit, :update]


  get "/homes/about" => "homes#about", as: "about"


  # get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
