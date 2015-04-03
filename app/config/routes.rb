App::Application.routes.draw do

  resources :businesses


  root :to => "map#index"
  resources :map

end
