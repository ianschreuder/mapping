class DataController < ApplicationController

  def forecasts
    @turbine = Turbine.find_by_id(params[:id])
    if params[:week]
      forecasts = get_week_forecasts(@turbine, params[:week])
      forecasts.each{|fore| p fore.verify_day}
    else
      forecasts = @turbine.forecasts[0..10]
    end
    @observed = forecasts.map{|fore| {:value=>fore.observed, :label=>fore.verify_hour}}
    @forecast = forecasts.map{|fore| {:value=>fore.forecast, :label=>fore.verify_hour}}
  end

  def turbines
    @turbines = Turbine.find(1,2,3).map{|t| {:lat => t.lat, :long => t.long, :id => t.id} }
    render(:json => @turbines)
  end


  private

  def get_week_forecasts(turbine, week_number)
    forecasts = turbine.forecasts
    date = Date.parse(forecasts[0].verify_day.to_s)
    day_s = (date + (week_number.to_i-1).weeks).to_s.gsub("-","").to_i
    day_e = (date + (week_number.to_i).weeks).to_s.gsub("-","").to_i
    forecasts.select{|forecast| forecast.verify_day >= day_s && forecast.verify_day < day_e}
  end
end 
