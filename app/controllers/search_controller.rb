class SearchController < ApplicationController
  def new
    @search_condition = SearchCondition.new()
  end

  #search for flats in moscow
  def flat
    @search_condition = SearchCondition.new()
    @search_condition.city = "Москва"
    @subway_stations = SubwayStation.find(:all)
  end

  #search for flats in MO
  def flat_mo
    @search_condition = SearchCondition.new()
    @search_condition.city = "МО"
    @districts = MoDistrict.find(:all)

  end

  #search for office in Moscow
  def office
    @search_condition = SearchCondition.new()
    @search_condition.city = "Москва"
    @realty_types = RealtyType.get_office_types
    @subway_stations = SubwayStation.find(:all)
  end

  #search for office in MO
  def office_mo
    @search_condition = SearchCondition.new()
    @search_condition.city = "МО"
    @realty_types = RealtyType.get_office_types
    @districts = MoDistrict.find(:all)
  end

  #search for suburban
  def suburban
    @search_condition = SearchCondition.new()
    @realty_types = RealtyType.get_suburban_types
    @rent_time_types = RentTimeType.get_rent_time_types
    #todo: add sorting by name
    @higways = Highway.find(:all)
  end




  def old
  end

  def find
  end

  def result
    
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @search_condition.get_hash2.each_pair {|key,value|
      @qs += "#{key} = '#{value}' AND "
    }

    #slice last " AND "
    if @qs != ""
      @qs.slice!(@qs.length-5..@qs.length)
    end

    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE

    #    @entries = Entry.find(:all,:conditions => ["city = ? AND street = ? AND rooms_count = ?",
    #                                            @search_condition.city,
    #                                            @search_condition.street,
    #                                            @search_condition.rooms_count]
    #                      );
  end

  def result_flat
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end

  def result_suburban
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end


  def result_flat_mo
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end

  def result_office
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end

  def result_office_mo
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end



end
