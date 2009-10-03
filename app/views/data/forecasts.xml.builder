xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.graph(:showValues=>'0' ) do
  xml.categories do
    @observed.each do |measurement|
      xml.category(:label=>measurement[:label])
    end
  end
  xml.dataset(:seriesName => "observed") do
    @observed.each do |measurement|
      xml.set :value => measurement[:value]
    end
  end
  xml.dataset(:seriesName => "forecast") do
    @forecast.each do |measurement|
      xml.set :value => measurement[:value]
    end
  end

end
