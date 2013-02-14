PedwayChicago::Application.routes.draw do

  resources :locations, :only => [:index, :show]

  root :to => 'locations#index'

end
