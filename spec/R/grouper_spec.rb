require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../spec_utils'

describe "Grouper" do
  
  before(:all) do
    $rsruby.source(File.dirname(__FILE__) + '/../../lib/R/grouper.R')
  end

  # passing coords as [:service_id, :latitude, :longitude].  Expecting [:service_id, :latitude, :longitude, :group] back
  it "should group coordinates into specified number of groups by nearest neighbors" do
    coords = [ [1,45,100],[2,40,100],[3,45,-100],[4,40,-100],[5,-45,-100],[6,-40,-100],[7,-45,100],[8,-40,100] ]
    grouped_coords = $rsruby.group(coords, 4)
    grouped_coords[0][3].should == 1
    grouped_coords[1][3].should == 1
    grouped_coords[3][3].should == 2
    grouped_coords[5][3].should == 3
    grouped_coords[8][3].should == 4
  end
  
end
