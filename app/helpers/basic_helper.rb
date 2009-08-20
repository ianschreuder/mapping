module BasicHelper

  def coord_style(coord)
    "X: <b>#{coord.x_utm}</b>; Y: <b>#{coord.y_utm}</b>; Latitude: <b>#{coord.latitude}</b>; Longitude: <b>#{coord.longitude}</b>"
  end
  
end
