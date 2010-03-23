class AdministrativeAreasController < ApplicationController
  # GET /administrative_areas
  # GET /administrative_areas.xml
  def index
    @administrative_areas = AdministrativeArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @administrative_areas }
    end
  end

  # GET /administrative_areas/1
  # GET /administrative_areas/1.xml
  def show
    @administrative_area = AdministrativeArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administrative_area }
    end
  end

  # GET /administrative_areas/new
  # GET /administrative_areas/new.xml
  def new
    @administrative_area = AdministrativeArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administrative_area }
    end
  end

  # GET /administrative_areas/1/edit
  def edit
    @administrative_area = AdministrativeArea.find(params[:id])
  end

  # POST /administrative_areas
  # POST /administrative_areas.xml
  def create
    @administrative_area = AdministrativeArea.new(params[:administrative_area])

    respond_to do |format|
      if @administrative_area.save
        flash[:notice] = 'AdministrativeArea was successfully created.'
        format.html { redirect_to(@administrative_area) }
        format.xml  { render :xml => @administrative_area, :status => :created, :location => @administrative_area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @administrative_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /administrative_areas/1
  # PUT /administrative_areas/1.xml
  def update
    @administrative_area = AdministrativeArea.find(params[:id])

    respond_to do |format|
      if @administrative_area.update_attributes(params[:administrative_area])
        flash[:notice] = 'AdministrativeArea was successfully updated.'
        format.html { redirect_to(@administrative_area) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @administrative_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /administrative_areas/1
  # DELETE /administrative_areas/1.xml
  def destroy
    @administrative_area = AdministrativeArea.find(params[:id])
    @administrative_area.destroy

    respond_to do |format|
      format.html { redirect_to(administrative_areas_url) }
      format.xml  { head :ok }
    end
  end
end
