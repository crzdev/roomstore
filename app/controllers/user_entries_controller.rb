
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

  # GET /entries/1
  # GET /entries/1.xml
  def show
    #todo: add entry  check that entry belongs to current user
    @entry = Entry.find(params[:id])
    if @entry.user.id != session[:user_id]
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


  # GET /entries/1/edit
  def edit
    #todo: add entry  check that entry belongs to current user
    @entry = Entry.find(params[:id])
    if @entry.user.id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end
  end

  def edit_rent
    #todo: add entry  check that entry belongs to current user
    @rent_entry = RentEntry.find(params[:id])
    if @rent_entry.user.id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end

  end

  # POST /entries
  # POST /entries.xml
  def create_rent
    #todo: add entry  check that entry belongs to current user
    @rent_entry = RentEntry.new(params[:rent_entry])
    if @rent_entry.user.id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end

    respond_to do |format|
        if @rent_entry.save
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
    if @rent_entry.user.id != session[:user_id]
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
        format.xml  { render :xml => @rent_entry.eerrors, :status => :unprocessable_entity }
      end

      end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    #todo: add entry  check that entry belongs to current user
    @entry = Entry.find(params[:id])

    if @rent_entry.user.id != session[:user_id]
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

