class MoDistrictsController < ApplicationController
  # GET /mo_districts
  # GET /mo_districts.xml
  def index
    @mo_districts = MoDistrict.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mo_districts }
    end
  end

  # GET /mo_districts/1
  # GET /mo_districts/1.xml
  def show
    @mo_district = MoDistrict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mo_district }
    end
  end

  # GET /mo_districts/new
  # GET /mo_districts/new.xml
  def new
    @mo_district = MoDistrict.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mo_district }
    end
  end

  # GET /mo_districts/1/edit
  def edit
    @mo_district = MoDistrict.find(params[:id])
  end

  # POST /mo_districts
  # POST /mo_districts.xml
  def create
    @mo_district = MoDistrict.new(params[:mo_district])

    respond_to do |format|
      if @mo_district.save
        flash[:notice] = 'MoDistrict was successfully created.'
        format.html { redirect_to(@mo_district) }
        format.xml  { render :xml => @mo_district, :status => :created, :location => @mo_district }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mo_district.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mo_districts/1
  # PUT /mo_districts/1.xml
  def update
    @mo_district = MoDistrict.find(params[:id])

    respond_to do |format|
      if @mo_district.update_attributes(params[:mo_district])
        flash[:notice] = 'MoDistrict was successfully updated.'
        format.html { redirect_to(@mo_district) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mo_district.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mo_districts/1
  # DELETE /mo_districts/1.xml
  def destroy
    @mo_district = MoDistrict.find(params[:id])
    @mo_district.destroy

    respond_to do |format|
      format.html { redirect_to(mo_districts_url) }
      format.xml  { head :ok }
    end
  end
end
