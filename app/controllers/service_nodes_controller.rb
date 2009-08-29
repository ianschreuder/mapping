class ServiceNodesController < ApplicationController
  layout "application"

  def index
    @nodes = ServiceNode.find(:all).paginate({:page => params[:page], :per_page => 50})
  end
  
end
