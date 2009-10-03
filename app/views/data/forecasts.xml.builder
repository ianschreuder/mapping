xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.graph do
  @forecasts.each do |forecast|
    xml.set :value => forecast[:value], :label => forecast[:label]
  end
end
