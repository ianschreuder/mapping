class Turbine < ActiveRecord::Base
  has_many :turbine_forecasts

  alias_attribute :forecasts, :turbine_forecasts 

end
