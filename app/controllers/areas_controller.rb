class AreasController < ApplicationController
  layout "application"

  def index
    @areas = Area.find(:all).paginate({:page => params[:page], :per_page => 20})
  end
  
  def new
    @area = Area.new
  end
  
  def create
    area = Area.new(params[:area])
    area.save
    render(:action => :index)
  end
  
end
