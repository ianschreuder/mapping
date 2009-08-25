class BasicController < ActionController::Base
  #layout "googlemap"
  
  def index
  end

  def coords
    render :json => Coord.find(:all).map{|c| {:latitude=>c.latitude, :longitude => c.longitude}}
  end

  def enodes
    render :json => Enode.find(:all).map{|node| {:latitude=>node.coord.latitude, :longitude => node.coord.longitude, :info1=>node.info1, :info2=>node.info2}}
  end

end

