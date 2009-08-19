class CoordsController < ApplicationController
  # GET /coords
  # GET /coords.xml
  def index
    @coords = Coord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coords }
    end
  end

  # GET /coords/1
  # GET /coords/1.xml
  def show
    @coord = Coord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coord }
    end
  end

  # GET /coords/new
  # GET /coords/new.xml
  def new
    @coord = Coord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coord }
    end
  end

  # GET /coords/1/edit
  def edit
    @coord = Coord.find(params[:id])
  end

  # POST /coords
  # POST /coords.xml
  def create
    @coord = Coord.new(params[:coord])

    respond_to do |format|
      if @coord.save
        flash[:notice] = 'Coord was successfully created.'
        format.html { redirect_to(@coord) }
        format.xml  { render :xml => @coord, :status => :created, :location => @coord }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coords/1
  # PUT /coords/1.xml
  def update
    @coord = Coord.find(params[:id])

    respond_to do |format|
      if @coord.update_attributes(params[:coord])
        flash[:notice] = 'Coord was successfully updated.'
        format.html { redirect_to(@coord) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coords/1
  # DELETE /coords/1.xml
  def destroy
    @coord = Coord.find(params[:id])
    @coord.destroy

    respond_to do |format|
      format.html { redirect_to(coords_url) }
      format.xml  { head :ok }
    end
  end
end
