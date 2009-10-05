class Turbine < ActiveRecord::Base
  has_many :turbine_forecasts

  alias_attribute :forecasts, :turbine_forecasts 

  def nearest_neighbors(num)
    Turbine.find(1,2,3).reject{|turbine| turbine.id == id}
  end

end
