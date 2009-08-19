class BasicController < ActionController::Base
  
  def index
    @coords = Coord.find(:all)
  end
  
end
