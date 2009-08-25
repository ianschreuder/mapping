class Coord < ActiveRecord::Base
  has_one :enode
  
  def to_s
    "x:#{x_utm}; y:#{y_utm}; lat:#{latitude}; long:#{longitude}"
  end
  
end
