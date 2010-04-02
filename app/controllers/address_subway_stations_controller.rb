class AddressSubwayStationsController < ApplicationController
  # GET /address_subway_stations
  # GET /address_subway_stations.xml
  def index
    @address_subway_stations = AddressSubwayStation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_subway_stations }
    end
  end

  # GET /address_subway_stations/1
  # GET /address_subway_stations/1.xml
  def show
    @address_subway_station = AddressSubwayStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_subway_station }
    end
  end

  # GET /address_subway_stations/new
  # GET /address_subway_stations/new.xml
  def new
    @address_subway_station = AddressSubwayStation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_subway_station }
    end
  end

  # GET /address_subway_stations/1/edit
  def edit
    @address_subway_station = AddressSubwayStation.find(params[:id])
  end

  # POST /address_subway_stations
  # POST /address_subway_stations.xml
  def create
    @address_subway_station = AddressSubwayStation.new(params[:address_subway_station])

    respond_to do |format|
      if @address_subway_station.save
        flash[:notice] = 'AddressSubwayStation was successfully created.'
        format.html { redirect_to(@address_subway_station) }
        format.xml  { render :xml => @address_subway_station, :status => :created, :location => @address_subway_station }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_subway_station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address_subway_stations/1
  # PUT /address_subway_stations/1.xml
  def update
    @address_subway_station = AddressSubwayStation.find(params[:id])

    respond_to do |format|
      if @address_subway_station.update_attributes(params[:address_subway_station])
        flash[:notice] = 'AddressSubwayStation was successfully updated.'
        format.html { redirect_to(@address_subway_station) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_subway_station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /address_subway_stations/1
  # DELETE /address_subway_stations/1.xml
  def destroy
    @address_subway_station = AddressSubwayStation.find(params[:id])
    @address_subway_station.destroy

    respond_to do |format|
      format.html { redirect_to(address_subway_stations_url) }
      format.xml  { head :ok }
    end
  end
end
