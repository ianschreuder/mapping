ActionController::Routing::Routes.draw do |map|
  map.resources :coords
  map.resources :enodes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => "dash"

end
