App::Application.routes.draw do

  resources :businesses, only: [:index]
  resources :businesscategories, only: [:index]
  resources :categories, only: [:index]
  resources :reviews, only: [:index]
  resources :businessattributes, only: [:index]
  resources :zattributes, only: [:index]
  resources :businesscategories, only: [:index]

end
