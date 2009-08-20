class BasicController < ActionController::Base
  
  def index
    @coord = Coord.find(:first)
  end
  
end
