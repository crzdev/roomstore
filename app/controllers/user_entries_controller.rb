
class UserEntriesController < ApplicationController
  # GET /entries
  # GET /entries.xml
  def index
    @entries = User.find_by_id(session[:user_id]).entries
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  def list_entries

    @entries_pages = Paginator.new self, Entries.count, 2, params[:page]
    @entries = Entries.find :all, :conditions => ["user_id = ?",session[:user_id]],
    :order => "created_at", :limit => @entries_pages.items_per_page, 
    :offset => @person_pages.curent.offset
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    #todo: add entry  check that entry belongs to current user
    @entry = Entry.find(params[:id])
    if @entry.user_id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @entry }
      end
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = Entry.new
    @entry.user_id = session[:user_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  def new_rent
    @rent_entry = RentEntry.new
    @rent_entry.user_id = session[:user_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  def new_rent_subway
    @rent_entry = RentEntry.new
    @rent_entry.user_id = session[:user_id]
    @subway_stations = SubwayStation.find(:all)
    @ess = EntriesSubwayStations.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end



  # GET /entries/1/edit
  def edit
    #todo: add entry  check that entry belongs to current user
    @entry = Entry.find(params[:id])
    if @entry.user_id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end
  end

  def edit_rent
    #todo: add entry  check that entry belongs to current user
    @rent_entry = RentEntry.find(params[:id])
    if @rent_entry.user_id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end

  end

  # POST /entries
  # POST /entries.xml
  def create_rent
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
    respond_to do |format|
      if @rent_entry.save
        if @subway_station != nil
          @ess = @rent_entry.entries_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station][:time_to])
          @ess.save
        end

          flash[:notice] = 'Entry was successfully created.'
          format.html { redirect_to :action => :show, :id => @rent_entry.id}
          format.xml  { render :xml => @rent_entry, :status => :created, :location => @entry }
        else
          format.html { render :action => "new_rent" }
          format.xml  { render :xml => @rent_entry.errors, :status => :unprocessable_entity }
        end
      end
  end

  #for testing rent creating with subway select list
  def create_rent_subway
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
    respond_to do |format|
      if @rent_entry.save
        if @subway_station != nil
          @ess = @rent_entry.entries_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station][:time_to])
          @ess.save
        end
          flash[:notice] = 'Entry was successfully created.'
          format.html { redirect_to :action => :show, :id => @rent_entry.id}
          format.xml  { render :xml => @rent_entry, :status => :created, :location => @entry }
        else
          format.html { render :action => "new_rent" }
          format.xml  { render :xml => @rent_entry.errors, :status => :unprocessable_entity }
        end
      end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update_rent
    #todo: add entry  check that entry belongs to current user
    @rent_entry = RentEntry.find(params[:id])
    if @rent_entry.user_id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end

    respond_to do |format|
      if @rent_entry.update_attributes(params[:rent_entry])
        flash[:notice] = 'Entry was successfully updated.'
        format.html { redirect_to(user_entry_path(@rent_entry)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rent_entry.errors, :status => :unprocessable_entity }
      end

      end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    #todo: add entry  check that entry belongs to current user
    @entry = Entry.find(params[:id])
    if @entry.user_id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end

    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(user_entries_url) }
      format.xml  { head :ok }
      end

  end

end

