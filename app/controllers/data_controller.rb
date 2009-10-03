class DataController < ApplicationController

  def forecasts
    @forecasts = Turbine.find(1).forecasts[0..10].map{|fore| {:value=>fore.hourly_ws, :label=>fore.day}}
  end

  def turbines
    @turbines = Turbine.find(1,2,3).map{|t| {:lat => t.lat, :long => t.long, :id => t.id} }
    render(:json => @turbines)
  end

end 
