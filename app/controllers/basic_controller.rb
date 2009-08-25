class BasicController < ActionController::Base
  #layout "googlemap"
  
  def index
  end

  def coords
    render :json => Coord.find(:all).map{|c| {:latitude=>c.latitude, :longitude => c.longitude}}
  end

end

