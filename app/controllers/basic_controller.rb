class BasicController < ActionController::Base
  layout "application"
  
  def index
  end

  def coords
    coords = (params[:coord]) ? get_coords_for_location(params[:coord][:latitude], params[:coord][:longitude]) : []
    render :json => coords.map{|c| {:latitude=>c.latitude, :longitude => c.longitude}}
  end

  def enodes
    render :json => Enode.find(:all).map{|node| {:latitude=>node.coord.latitude, :longitude => node.coord.longitude, :info1=>node.info1, :info2=>node.info2}}
  end
  
  private
  
  def get_coords_for_location(lat,long)
    return [] unless lat && long
    Coord.find(:all).reject{|c| (lat.to_f - c.latitude).abs > 0.001  && (long.to_f - c.longitude).abs > 0.001}
  end

end

