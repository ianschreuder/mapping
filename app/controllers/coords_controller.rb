class CoordsController < ApplicationController
  layout "application"

  def index
    @coords = Coord.all
  end

  def show
    @coord = Coord.find(params[:id])
  end

  def new
    @coord = Coord.new
  end

  def edit
    @coord = Coord.find(params[:id])
  end

  def create
    @coord = Coord.new(params[:coord])
    if @coord.save
      flash[:notice] = 'Coord was successfully created.'
      redirect_to(@coord)
    else
      render :action => "new"
    end
  end

  def update
    @coord = Coord.find(params[:id])
    if @coord.update_attributes(params[:coord])
      flash[:notice] = 'Coord was successfully updated.'
      redirect_to(@coord)
    else
      render :action => "edit"
    end
  end

  def destroy
    @coord = Coord.find(params[:id])
    @coord.destroy
    redirect_to(coords_url)
  end
end
