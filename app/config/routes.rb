App::Application.routes.draw do

  root :to => "map#index"
  resources :map

end
