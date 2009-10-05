class DataController < ApplicationController

  def turbines
    @turbines = Turbine.find(1,2,3).map{|t| {:lat => t.lat, :long => t.long, :id => t.id, :label => t.label} }
    render(:json => @turbines)
  end

  def forecasts
    @turbine = Turbine.find_by_id(params[:id])
    @forecasts = get_week_forecasts(@turbine, params[:week])
  end


  def neighbors
    @forecast = TurbineForecast.find(params[:id])
    @forecasts = [@forecast]
    @turbine = @forecast.turbine
    @neighbors = @turbine.nearest_neighbors(3)
    @neighbors.each{|turbine| @forecasts << TurbineForecast.find_by_sql("select * from turbine_forecasts where turbine_id = #{turbine.id} and verify_day = #{@forecast.verify_day} and verify_hour = #{@forecast.verify_hour} limit 1")[0]}
  end

  private

  def get_week_forecasts(turbine, week_number)
    @week = "Week #{week_number}"
    forecasts = turbine.forecasts
    date = Date.parse(forecasts[0].verify_day.to_s)
    day_s = (date + (week_number.to_i-1).weeks).to_s.gsub("-","").to_i
    day_e = (date + (week_number.to_i).weeks).to_s.gsub("-","").to_i
    forecasts.select{|forecast| forecast.verify_day >= day_s && forecast.verify_day < day_e}
  end
end 
