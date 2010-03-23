class SubAdministrativeAreasController < ApplicationController
  # GET /sub_administrative_areas
  # GET /sub_administrative_areas.xml
  def index
    @sub_administrative_areas = SubAdministrativeArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_administrative_areas }
    end
  end

  # GET /sub_administrative_areas/1
  # GET /sub_administrative_areas/1.xml
  def show
    @sub_administrative_area = SubAdministrativeArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_administrative_area }
    end
  end

  # GET /sub_administrative_areas/new
  # GET /sub_administrative_areas/new.xml
  def new
    @sub_administrative_area = SubAdministrativeArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_administrative_area }
    end
  end

  # GET /sub_administrative_areas/1/edit
  def edit
    @sub_administrative_area = SubAdministrativeArea.find(params[:id])
  end

  # POST /sub_administrative_areas
  # POST /sub_administrative_areas.xml
  def create
    @sub_administrative_area = SubAdministrativeArea.new(params[:sub_administrative_area])

    respond_to do |format|
      if @sub_administrative_area.save
        flash[:notice] = 'SubAdministrativeArea was successfully created.'
        format.html { redirect_to(@sub_administrative_area) }
        format.xml  { render :xml => @sub_administrative_area, :status => :created, :location => @sub_administrative_area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_administrative_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_administrative_areas/1
  # PUT /sub_administrative_areas/1.xml
  def update
    @sub_administrative_area = SubAdministrativeArea.find(params[:id])

    respond_to do |format|
      if @sub_administrative_area.update_attributes(params[:sub_administrative_area])
        flash[:notice] = 'SubAdministrativeArea was successfully updated.'
        format.html { redirect_to(@sub_administrative_area) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_administrative_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_administrative_areas/1
  # DELETE /sub_administrative_areas/1.xml
  def destroy
    @sub_administrative_area = SubAdministrativeArea.find(params[:id])
    @sub_administrative_area.destroy

    respond_to do |format|
      format.html { redirect_to(sub_administrative_areas_url) }
      format.xml  { head :ok }
    end
  end
end
