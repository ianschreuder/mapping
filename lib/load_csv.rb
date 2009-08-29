require 'csv'
Coord

require 'FileUtils'
def open_csv_file(filepath, &block)
  CSV.parse(File.open(filepath, 'r')) do |row|
    block.call row
  end
end

file = RAILS_ROOT + "/transformed_coords_lat_long.csv"

contents = []
open_csv_file(file){|row| contents << row }
headers = contents.shift
data = contents
data.each do |line|
  node = ServiceNode.new(:identifier => line[2].to_i)
  coord = Coord.new(:longitude => line[0].to_f, :latitude => line[1].to_f)
  node.coord = coord
  coord.save
  node.save
end

