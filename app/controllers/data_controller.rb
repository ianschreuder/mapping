class DataController < ApplicationController

  def forecasts
    @forecasts = TurbineForecast.find(:all, :conditions => "id < 11")
  end

end 
