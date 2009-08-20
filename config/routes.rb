ActionController::Routing::Routes.draw do |map|
  map.resources :coords
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => "dash"

end
