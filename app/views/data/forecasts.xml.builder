xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.chart(:caption => "Turbine: #{@turbine.label} (#{@week})", :showValues=>'0', :xAxisName=>'Date-Hour', :yAxisName=>'Power', :labelStep => 24 ) do
  xml.categories do
    @forecasts.each do |forecast|
      date = Date.parse(forecast.verify_day.to_s)
      xml.category(:label=>"#{date.month}/#{date.day}-#{forecast.verify_hour}")
    end
  end
  xml.dataset(:seriesName => "observed") do
    @forecasts.each do |forecast|
      value = (forecast.observed * 100).round/100.to_f
      xml.set :value => value, :link => "javascript:clickPoint(#{forecast.id})"
    end
  end
  xml.dataset(:seriesName => "forecast") do
    @forecasts.each do |forecast|
      value = (forecast.forecast * 100).round/100.to_f
      xml.set :value => value, :link => "javascript:clickPoint(#{forecast.id})"
    end
  end

end
