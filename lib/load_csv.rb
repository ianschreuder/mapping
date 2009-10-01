IRB.echo_off
require 'csv'
Turbine
TurbineForecast

require 'FileUtils'
def open_csv_file(filepath, &block)
  CSV.parse(File.open(filepath, 'r')) do |row|
    block.call row
  end
end

file = RAILS_ROOT + "/data/wind data.csv"

contents = []
open_csv_file(file){|row| contents << row }
headers = contents.shift
data = contents
data.each do |line|
  turbine = Turbine.find_by_label(line[3]) || Turbine.new(:label => line[3])
  forecast = TurbineForecast.new(:iso_date => line[1], :hourly_ws => line[2], :created_at => line[4],
                                 :verify_day => line[5], :verify_hour => line[6], :lead_time => line[7],
                                 :forecast => line[8], :observed => line[9], :error => line[10])
  forecast.turbine = turbine
  turbine.save
  forecast.save
end
