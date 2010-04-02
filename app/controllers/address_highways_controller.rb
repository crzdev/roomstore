class AddressHighwaysController < ApplicationController
  # GET /address_highways
  # GET /address_highways.xml
  def index
    @address_highways = AddressHighway.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_highways }
    end
  end

  # GET /address_highways/1
  # GET /address_highways/1.xml
  def show
    @address_highway = AddressHighway.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_highway }
    end
  end

  # GET /address_highways/new
  # GET /address_highways/new.xml
  def new
    @address_highway = AddressHighway.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_highway }
    end
  end

  # GET /address_highways/1/edit
  def edit
    @address_highway = AddressHighway.find(params[:id])
  end

  # POST /address_highways
  # POST /address_highways.xml
  def create
    @address_highway = AddressHighway.new(params[:address_highway])

    respond_to do |format|
      if @address_highway.save
        flash[:notice] = 'AddressHighway was successfully created.'
        format.html { redirect_to(@address_highway) }
        format.xml  { render :xml => @address_highway, :status => :created, :location => @address_highway }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_highway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address_highways/1
  # PUT /address_highways/1.xml
  def update
    @address_highway = AddressHighway.find(params[:id])

    respond_to do |format|
      if @address_highway.update_attributes(params[:address_highway])
        flash[:notice] = 'AddressHighway was successfully updated.'
        format.html { redirect_to(@address_highway) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_highway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /address_highways/1
  # DELETE /address_highways/1.xml
  def destroy
    @address_highway = AddressHighway.find(params[:id])
    @address_highway.destroy

    respond_to do |format|
      format.html { redirect_to(address_highways_url) }
      format.xml  { head :ok }
    end
  end
end
