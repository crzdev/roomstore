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


  #new test view for new model structure
  def new_rent
    @rent_entry = RentEntry.new
    @address_text = AddressText.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  #new view for adding new rent entry about flat or room in Moscow
  def new_rent_room_flat_moscow
    @rent_entry = RentEntry.new
    @address_text = AddressText.new
    @address_text.locality = "Москва"
  end

  #new view for adding new rent entry about flat or room in MO
  def new_rent_room_flat_mo
    @rent_entry = RentEntry.new
    @address_text = AddressText.new
    @address_text.administrative_area = "Московская Область"
  end

  #new view for adding new rent entry about suburban realty
  def new_rent_suburban
    @rent_entry = RentEntry.new
    @address_text = AddressText.new
  end

  #new view for adding new rent entry about nonresidential realty in Moscow
  def new_rent_nonresid_moscow
    @rent_entry = RentEntry.new
    @address_text = AddressText.new
    @address_text.locality = "Москва"
  end

  #new eview for adding new rent entry about nonresidential realty in MO
  def new_rent_nonresid_mo
    @rent_entry = RentEntry.new
    @address_text = AddressText.new
    @address_text.administrative_area = "Московская Область"
  end

  #view for viewing curent users all rent entries
  def my_rents
    sc = SearchCondition.new(:user_id => session[:user_id])
    @entries = Entry.find_with_search_condition(sc)
  end

  #view for viewing curent users rent entries about flat or room in Moscow or MO
  def my_rents_flat_and_room
    sc = SearchCondition.new(:user_id => session[:user_id],
                             :realty_types => ["flat","room"]
                             )
    @entries = Entry.find_with_search_condition(sc)
  end

  #view for viewing curent users rent entries about suburban realty
  def my_rents_suburban
    sc = SearchCondition.new(:user_id => session[:user_id],
                             :realty_types => ["house","part_of_house","plot","townhouse"]
                             )
    @entries = Entry.find_with_search_condition(sc)
    @qs = sc.get_sql_condition
  end

  #view for viewing curent users rent entries about office in Moscow or MO
  def my_rents_office
    sc = SearchCondition.new(:user_id => session[:user_id],
                             :city => "Москва", #todo: add code to process several cities in SearchCondition
                             :realty_types => ["office","trading_floor","warehouse","catering","free_app","garage","manufacture","legal_address","autoservice","selling_business"]
                             )
    @entries = Entry.find_with_search_condition(sc)
    
  end

  def edit_rent
    #todo: add entry  check that entry belongs to current user
    @rent_entry = RentEntry.find(params[:id])
    if @rent_entry.user_id != session[:user_id]
      flash[:notice] = "You can't edit this entry"
      redirect_to :action => "index"
    end
  end

  #method for testing
  def create_rent
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @address_text = AddressText.new(params[:address_text])
    #todo: is it necesary? look below
    @address_text.country = "Россия"
    if AddressHelper.is_resolved_by_db? @address_text
      #todo: remove loging
      Ml.w "#{@address_text} is resolved by DB"
      Ml.w "#{@address_text.get_address_string}"
      @address = @rent_entry.build_address (AddressHelper.build_model_for @address_text)
      if params[:subway_station][:id] != ""
        @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
      end
      @highway = Highway.find_by_id(params[:highway][:id])
      if @rent_entry.save
        if @subway_station != nil
          @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
          @ass.save
        end
        if @highway != nil
          @ah = @address.address_highways.create(:highway_id => @highway.id,:distance_to_mkad => params[:highway_distance_to_mkad])
          @ah.save
        end
        flash[:notice] = "Новая запись успешно добавлена"
        redirect_to :action => "new_rent"
      else
        render :action => "new_rent" 
      end
    else
      if AddressHelper.is_resolved_by_ym? @address_text
        #todo: remove loging
        Ml.w "#{@address_text} is resolved by YM"
        Ml.w "#{@address_text.get_address_string}"
        @address = @rent_entry.build_address (AddressHelper.build_model_for @address_text)
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        #todo: remove comment below
        #        @highways = Highway.find_by_id(params[:highway][:id])
        if @rent_entry.save
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          if @highway != nil
            @ah = @address.address_highways.create(:highway_id => @highway.id,:distance_to_mkad => params[:highway_distance_to_mkad])
            @ah.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent"
        else
          render :action => "new_rent" 
        end
      else
        Ml.w "#{@address_text.get_address_string} CAN NOT BE resolved by YM"
        @address_variants = AddressHelper.get_variants_for @address_text
        flash[:notice] = "Убедитесь в правильности Адресса"
        render :action => "new_rent" 
      end
    end
  end

  
  #working method
  #creates rent entry with address from coresponding form
  def create_rent_room_flat_moscow
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @address_text = nil
    if params[:address_text] != nil
      @address_text = AddressText.new(params[:address_text])
      #todo: is it necesary? look below
      @address_text.country = "Россия"
    end
    @address_variant_string = nil
    if params[:address_variant] != nil
      @address_variant_string = params[:address_variant][:variant]
    end
    #todo: look at code. mb bring this if upper in this method 
    #to avoid izbitochnie asign and var. initialization?
    if @address_variant_string != nil && @address_variant_string != ""
      #We got address_variant from form
      Ml.w "Got address variant from form: #{@address_variant_string}"
      Ml.w "Going to check it"
      #user selected address variant string
      #check below is needed to prevent HTML form hacking
      if AddressHelper.is_address_string_resolved_by_ym? @address_variant_string
        Ml.w "This address variant resolved by Yms"
        #all ok! do all things for saving entry
        xml = Yms.geocode @address_variant_string
        ats = AddressHelper.get_address_texts xml
        Ml.w "Going to build model for: #{ats[0].get_address_string}"
        #        @address = @rent_entry.build_address (AddressHelper.build_model_for ats[0])
        @address = AddressHelper.build_model_for ats[0]
        @address.save
        @rent_entry.address = @address
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        if @rent_entry.save
          Ml.w "New rent entry saved!!"
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_room_flat_moscow"
        else
          @address.destroy
          render :action => "new_rent_room_flat_moscow" 
        end
      else
        Ml.w "This address variant does not resolved by Yms"
        #some one tryed to hack HTML or it is bug ;|
        #todo: add watcher for this event. bloack ips who tried to hack
      end
    else
      #There is no address variants! Working with AddressText object!
      Ml.w "Working with address_text: #{@address_text.get_address_string}"
      if AddressHelper.is_resolved_by_db? @address_text
        #todo: remove loging
        Ml.w "#{@address_text} is resolved by DB"
        Ml.w "#{@address_text.get_address_string}"
        @address = @rent_entry.build_address (AddressHelper.build_model_for @address_text)
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        @highway = Highway.find_by_id(params[:highway][:id])
        if @rent_entry.save
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          if @highway != nil
            @ah = @address.address_highways.create(:highway_id => @highway.id,:distance_to_mkad => params[:highway_distance_to_mkad])
            @ah.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_room_flat_moscow"
        else
          @address.destroy
          render :action => "new_rent_rent_room_flat_moscow" 
        end
      else
        if AddressHelper.is_resolved_by_ym? @address_text
          #todo: remove loging
          Ml.w "#{@address_text} is resolved by YM"
          Ml.w "#{@address_text.get_address_string}"
          @address = AddressHelper.build_model_for @address_text
          @address.save
          @rent_entry.address = @address
          if params[:subway_station][:id] != ""
            @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
          end
          if @rent_entry.save
            if @subway_station != nil
              @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
              @ass.save
            end
            flash[:notice] = "Новая запись успешно добавлена"
            redirect_to :action => "new_rent_room_flat_moscow"
          else
            @address.destroy
            render :action => "new_rent_room_flat_moscow" 
          end
        else
          Ml.w "#{@address_text.get_address_string} CAN NOT BE resolved by YM"
          @address_variants = AddressHelper.get_variants_for @address_text
          flash[:notice] = "Убедитесь в правильности Адресса"
          render :action => "new_rent_room_flat_moscow" 
        end
      end
    end
  end

  #working method
  #creates rent entry with address from coresponding form
  def create_rent_room_flat_mo
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @address_text = nil
    if params[:address_text] != nil
      @address_text = AddressText.new(params[:address_text])
      @address_text.administrative_area = "Москвоская область"
      #todo: is it necesary? look below
      @address_text.country = "Россия"
    end
    @address_variant_string = nil
    if params[:address_variant] != nil
      @address_variant_string = params[:address_variant][:variant]
    end
    #todo: look at code. mb bring this if upper in this method 
    #to avoid izbitochnie asign and var. initialization?
    if @address_variant_string != nil && @address_variant_string != ""
      #We got address_variant from form
      Ml.w "Got address variant from form: #{@address_variant_string}"
      Ml.w "Going to check it"
      #user selected address variant string
      #check below is needed to prevent HTML form hacking
      if AddressHelper.is_address_string_resolved_by_ym? @address_variant_string
        Ml.w "This address variant resolved by Yms"
        #all ok! do all things for saving entry
        xml = Yms.geocode @address_variant_string
        ats = AddressHelper.get_address_texts xml
        Ml.w "Going to build model for: #{ats[0].get_address_string}"
        #        @address = @rent_entry.build_address (AddressHelper.build_model_for ats[0])
        @address = AddressHelper.build_model_for ats[0]
        @address.save
        @rent_entry.address = @address
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        if @rent_entry.save
          Ml.w "New rent entry saved!!"
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_room_flat_mo"
        else
          @address.destroy
          render :action => "new_rent_room_flat_mo" 
        end
      else
        Ml.w "This address variant does not resolved by Yms"
        #some one tryed to hack HTML or it is bug ;|
        #todo: add watcher for this event. bloack ips who tried to hack
      end
    else
      #There is no address variants! Working with AddressText object!
      Ml.w "Working with address_text: #{@address_text.get_address_string}"
      if AddressHelper.is_resolved_by_db? @address_text
        #todo: remove loging
        Ml.w "#{@address_text} is resolved by DB"
        Ml.w "#{@address_text.get_address_string}"
        @address = @rent_entry.build_address (AddressHelper.build_model_for @address_text)
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        @highway = Highway.find_by_id(params[:highway][:id])
        if @rent_entry.save
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          if @highway != nil
            @ah = @address.address_highways.create(:highway_id => @highway.id,:distance_to_mkad => params[:highway_distance_to_mkad])
            @ah.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_room_flat_mo"
        else
          @address.destroy
          render :action => "new_rent_room_flat_mo" 
        end
      else
        if AddressHelper.is_resolved_by_ym? @address_text
          #todo: remove loging
          Ml.w "#{@address_text} is resolved by YM"
          Ml.w "#{@address_text.get_address_string}"
          @address = AddressHelper.build_model_for @address_text
          @address.save
          @rent_entry.address = @address
          if params[:subway_station][:id] != ""
            @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
          end
          if @rent_entry.save
            if @subway_station != nil
              @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
              @ass.save
            end
            flash[:notice] = "Новая запись успешно добавлена"
            redirect_to :action => "new_rent_room_flat_mo"
          else
            @address.destroy
            render :action => "new_rent_room_flat_mo" 
          end
        else
          Ml.w "#{@address_text.get_address_string} CAN NOT BE resolved by YM"
          @address_variants = AddressHelper.get_variants_for @address_text
          flash[:notice] = "Убедитесь в правильности Адресса"
          render :action => "new_rent_room_flat_mo" 
        end
      end
    end
  end

  #working method
  #creates rent entry with address from coresponding form
  def create_rent_nonresid_moscow
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @address_text = nil
    if params[:address_text] != nil
      @address_text = AddressText.new(params[:address_text])
      #todo: is it necesary? look below
      @address_text.country = "Россия"
    end
    @address_variant_string = nil
    if params[:address_variant] != nil
      @address_variant_string = params[:address_variant][:variant]
    end
    #todo: look at code. mb bring this if upper in this method 
    #to avoid izbitochnie asign and var. initialization?
    if @address_variant_string != nil && @address_variant_string != ""
      #We got address_variant from form
      Ml.w "Got address variant from form: #{@address_variant_string}"
      Ml.w "Going to check it"
      #user selected address variant string
      #check below is needed to prevent HTML form hacking
      if AddressHelper.is_address_string_resolved_by_ym? @address_variant_string
        Ml.w "This address variant resolved by Yms"
        #all ok! do all things for saving entry
        xml = Yms.geocode @address_variant_string
        ats = AddressHelper.get_address_texts xml
        Ml.w "Going to build model for: #{ats[0].get_address_string}"
        #        @address = @rent_entry.build_address (AddressHelper.build_model_for ats[0])
        @address = AddressHelper.build_model_for ats[0]
        @address.save
        @rent_entry.address = @address
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        if @rent_entry.save
          Ml.w "New rent entry saved!!"
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_nonresid_moscow"
        else
          @address.destroy
          render :action => "new_rent_nonresid_moscow" 
        end
      else
        Ml.w "This address variant does not resolved by Yms"
        #some one tryed to hack HTML or it is bug ;|
        #todo: add watcher for this event. bloack ips who tried to hack
      end
    else
      #There is no address variants! Working with AddressText object!
      Ml.w "Working with address_text: #{@address_text.get_address_string}"
      if AddressHelper.is_resolved_by_db? @address_text
        #todo: remove loging
        Ml.w "#{@address_text} is resolved by DB"
        Ml.w "#{@address_text.get_address_string}"
        @address = @rent_entry.build_address (AddressHelper.build_model_for @address_text)
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        @highway = Highway.find_by_id(params[:highway][:id])
        if @rent_entry.save
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          if @highway != nil
            @ah = @address.address_highways.create(:highway_id => @highway.id,:distance_to_mkad => params[:highway_distance_to_mkad])
            @ah.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_nonresid_moscow"
        else
          @address.destroy
          render :action => "new_rent_nonresid_moscow" 
        end
      else
        if AddressHelper.is_resolved_by_ym? @address_text
          #todo: remove loging
          Ml.w "#{@address_text} is resolved by YM"
          Ml.w "#{@address_text.get_address_string}"
          @address = AddressHelper.build_model_for @address_text
          @address.save
          @rent_entry.address = @address
          if params[:subway_station][:id] != ""
            @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
          end
          if @rent_entry.save
            if @subway_station != nil
              @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
              @ass.save
            end
            flash[:notice] = "Новая запись успешно добавлена"
            redirect_to :action => "new_rent_nonresid_moscow"
          else
            @address.save
            render :action => "new_rent_nonresid_moscow" 
          end
        else
          Ml.w "#{@address_text.get_address_string} CAN NOT BE resolved by YM"
          @address_variants = AddressHelper.get_variants_for @address_text
          flash[:notice] = "Убедитесь в правильности Адресса"
          render :action => "new_rent_nonresid_moscow" 
        end
      end
    end
  end

  #working method
  #creates rent entry with address from coresponding form
  def create_rent_nonresid_mo
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @address_text = nil
    if params[:address_text] != nil
      @address_text = AddressText.new(params[:address_text])
      @address_text = "Московская область"
      #todo: is it necesary? look below
      @address_text.country = "Россия"
    end
    @address_variant_string = nil
    if params[:address_variant] != nil
      @address_variant_string = params[:address_variant][:variant]
    end
    #todo: look at code. mb bring this if upper in this method 
    #to avoid izbitochnie asign and var. initialization?
    if @address_variant_string != nil && @address_variant_string != ""
      #We got address_variant from form
      Ml.w "Got address variant from form: #{@address_variant_string}"
      Ml.w "Going to check it"
      #user selected address variant string
      #check below is needed to prevent HTML form hacking
      if AddressHelper.is_address_string_resolved_by_ym? @address_variant_string
        Ml.w "This address variant resolved by Yms"
        #all ok! do all things for saving entry
        xml = Yms.geocode @address_variant_string
        ats = AddressHelper.get_address_texts xml
        Ml.w "Going to build model for: #{ats[0].get_address_string}"
        #        @address = @rent_entry.build_address (AddressHelper.build_model_for ats[0])
        @address = AddressHelper.build_model_for ats[0]
        @address.save
        @rent_entry.address = @address
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        if @rent_entry.save
          Ml.w "New rent entry saved!!"
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_nonresid_mo"
        else
          @address.destroy
          render :action => "new_rent_nonresid_mo" 
        end
      else
        Ml.w "This address variant does not resolved by Yms"
        #some one tryed to hack HTML or it is bug ;|
        #todo: add watcher for this event. bloack ips who tried to hack
      end
    else
      #There is no address variants! Working with AddressText object!
      Ml.w "Working with address_text: #{@address_text.get_address_string}"
      if AddressHelper.is_resolved_by_db? @address_text
        #todo: remove loging
        Ml.w "#{@address_text} is resolved by DB"
        Ml.w "#{@address_text.get_address_string}"
        @address = @rent_entry.build_address (AddressHelper.build_model_for @address_text)
        if params[:subway_station][:id] != ""
          @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
        end
        @highway = Highway.find_by_id(params[:highway][:id])
        if @rent_entry.save
          if @subway_station != nil
            @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
            @ass.save
          end
          if @highway != nil
            @ah = @address.address_highways.create(:highway_id => @highway.id,:distance_to_mkad => params[:highway_distance_to_mkad])
            @ah.save
          end
          flash[:notice] = "Новая запись успешно добавлена"
          redirect_to :action => "new_rent_nonresid_mo"
        else
          @address.destroy
          render :action => "new_rent_nonresid_mo" 
        end
      else
        if AddressHelper.is_resolved_by_ym? @address_text
          #todo: remove loging
          Ml.w "#{@address_text} is resolved by YM"
          Ml.w "#{@address_text.get_address_string}"
          @address = AddressHelper.build_model_for @address_text
          @address.save
          @rent_entry.address = @address
          if params[:subway_station][:id] != ""
            @subway_station = SubwayStation.find_by_id(params[:subway_station][:id])
          end
          if @rent_entry.save
            if @subway_station != nil
              @ass = @address.address_subway_stations.create(:subway_station_id => @subway_station.id,:time_to => params[:subway_station_time_to])
              @ass.save
            end
            flash[:notice] = "Новая запись успешно добавлена"
            redirect_to :action => "new_rent_nonresid_mo"
          else
            @address.destroy
            render :action => "new_rent_nonresid_mo" 
          end
        else
          Ml.w "#{@address_text.get_address_string} CAN NOT BE resolved by YM"
          @address_variants = AddressHelper.get_variants_for @address_text
          flash[:notice] = "Убедитесь в правильности Адресса"
          render :action => "new_rent_nonresid_mo" 
        end
      end
    end
  end


  #create new rent entry for suburban
  def create_rent_suburban
    @rent_entry = RentEntry.new(params[:rent_entry])
    #entry is created for curent user
    @rent_entry.user_id = session[:user_id]
    @highway = Highway.find_by_id(params[:highway][:id])
    respond_to do |format|
      if @rent_entry.save
        if @highway != nil
          @eh = @rent_entry.entries_highways.create(:highway_id => @highway.id)
          @eh.save
        end
        flash[:notice] = 'Entry was successfully created.'
        format.html { redirect_to :action => :show, :id => @rent_entry.id}
        format.xml  { render :xml => @rent_entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new_rent_suburban" }
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

