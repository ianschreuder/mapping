class DataController < ApplicationController

  def meters
    render :json => Meter.find(:all).collect{|m| {:id=>m.id,:lat=>m.lat,:long=>m.long}}
  end

end 
