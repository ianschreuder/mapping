class TurbinesController < ActionController::Base
  layout "application"
  helper FusionHelper

  def index
  end
  
  def chart1
    @id = params[:id]
    @turbine = Turbine.find(@id)
    @query_string  = "#{@id}.xml"
    (params[:week]) ? @query_string += "?week=#{params[:week]}" : @query_string += "?week=1" 
  end

  def chart2
    @id = params[:id]
    @forecast = TurbineForecast.find(@id)
    @query_string  = "#{@id}.xml"
  end
end

