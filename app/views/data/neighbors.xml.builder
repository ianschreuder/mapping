xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
date = Date.parse(@forecast.verify_day.to_s)
xml.chart(:caption => "Self and Neighbors (day: #{date.month}/#{date.day}: hour: #{@forecast.verify_hour})", :showValues=>'0', :xAxisName=>'Turbine', :yAxisName=>'Power') do
  xml.categories do
    @forecasts.each do |forecast|
      xml.category(:label=>forecast.turbine.label)
    end
  end
  xml.dataset(:seriesName => "observed") do
    @forecasts.each do |forecast|
      value = (forecast.observed * 100).round/100.to_f
      xml.set :value => value
    end
  end
  xml.dataset(:seriesName => "forecast") do
    @forecasts.each do |forecast|
      value = (forecast.forecast * 100).round/100.to_f
      xml.set :value => value
    end
  end

end
