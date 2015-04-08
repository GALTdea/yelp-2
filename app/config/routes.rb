App::Application.routes.draw do

  resources :categories


  resources :businesscategories


  root :to => "map#index"
  resources :map
  resources :businesses, only: [:index]
  resources :businesscategories, only: [:index]
  resources :categories, only: [:index]

end
