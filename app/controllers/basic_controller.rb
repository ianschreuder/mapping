class BasicController < ActionController::Base
  layout "googlemap"
  
  def index
    @coord = Coord.find(:first)
  end
  
end
