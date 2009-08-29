class Coord < ActiveRecord::Base
  has_one :service_node
  
  def to_s
    "#{latitude} (lat); #{longitude} (long)"
  end
  
end
