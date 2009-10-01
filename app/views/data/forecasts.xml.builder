xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.graph do
  @forecasts.each_with_index do |forecast, index|
    xml.set :value => forecast.forecast, :name => index
  end
end