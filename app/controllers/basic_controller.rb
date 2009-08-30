class BasicController < ActionController::Base
  layout "application"
  
  def index
  end

  def coords
    lat_min = (params[:lat_min] && params[:lat_min] != "null") ? params[:lat_min].to_f : -90
    lat_max = (params[:lat_max] && params[:lat_max] != "null") ? params[:lat_max].to_f : 90
    lng_min = (params[:lng_min] && params[:lng_min] != "null") ? params[:lng_min].to_f : -180
    lng_max = (params[:lng_max] && params[:lng_max] != "null") ? params[:lng_max].to_f : 180
    center_lat = (lat_max + lat_min) / 2.0
    center_lng = (lng_max + lng_min) / 2.0
    coords = get_coords_for_location(lat_min, lat_max, lng_min, lng_max)
    coords = limit(coords)
p group(coords)
    data_points = coords.map{|c| {:latitude=>c.latitude, :longitude => c.longitude}}
    render :json => {:center => {:latitude => center_lat, :longitude => center_lng}, :data_points => data_points}
  end

  private
  
  def get_coords_for_location(lat_min, lat_max, lng_min, lng_max)
    return [] unless lat_min && lat_max && lng_min && lng_max
    Coord.find(:all, :conditions => "latitude > #{lat_min} and latitude < #{lat_max} and longitude > #{lng_min} and longitude < #{lng_max}")
  end
  
  def limit(coords)
    (coords && coords.length > 10) ? coords[0..10] : []
  end
  
  def group(coords)
    $rsruby.source(RAILS_ROOT + '/lib/coordinate_grouper.R')
    $rsruby.group(coords)
  end
  
end

