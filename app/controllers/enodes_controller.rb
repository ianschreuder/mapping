class EnodesController < ApplicationController
  layout "application"

  def index
    @nodes = Enode.find(:all)
  end

  def show
    @node = Enode.find(params[:id])
  end

  def new
    @node = Enode.new
  end

  def edit
    @node = Enode.find(params[:id])
  end

  def create
    @node = Enode.new(params[:node])
    if @node.save
      flash[:notice] = 'Enode was successfully created.'
      redirect_to(@node)
    else
      render :action => "new"
    end
  end

  def update
    @node = Enode.find(params[:id])
    if @node.update_attributes(params[:node])
      flash[:notice] = 'Enode was successfully updated.'
      redirect_to(@node)
    else
      render :action => "edit"
    end
  end

  def destroy
    @node = Enode.find(params[:id])
    @node.destroy
    redirect_to(enodes_url)
  end
end
