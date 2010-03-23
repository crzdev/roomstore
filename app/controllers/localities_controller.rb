class LocalitiesController < ApplicationController
  # GET /localities
  # GET /localities.xml
  def index
    @localities = Locality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @localities }
    end
  end

  # GET /localities/1
  # GET /localities/1.xml
  def show
    @locality = Locality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locality }
    end
  end

  # GET /localities/new
  # GET /localities/new.xml
  def new
    @locality = Locality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locality }
    end
  end

  # GET /localities/1/edit
  def edit
    @locality = Locality.find(params[:id])
  end

  # POST /localities
  # POST /localities.xml
  def create
    @locality = Locality.new(params[:locality])

    respond_to do |format|
      if @locality.save
        flash[:notice] = 'Locality was successfully created.'
        format.html { redirect_to(@locality) }
        format.xml  { render :xml => @locality, :status => :created, :location => @locality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /localities/1
  # PUT /localities/1.xml
  def update
    @locality = Locality.find(params[:id])

    respond_to do |format|
      if @locality.update_attributes(params[:locality])
        flash[:notice] = 'Locality was successfully updated.'
        format.html { redirect_to(@locality) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /localities/1
  # DELETE /localities/1.xml
  def destroy
    @locality = Locality.find(params[:id])
    @locality.destroy

    respond_to do |format|
      format.html { redirect_to(localities_url) }
      format.xml  { head :ok }
    end
  end
end
