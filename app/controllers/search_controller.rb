class SearchController < ApplicationController

  #search for flats in moscow
  def room_flat_moscow
    @search_condition = SearchCondition.new()
    @search_condition.locality = "Москва"
  end

  #search for flats in MO
  def room_flat_mo
    @search_condition = SearchCondition.new()
  end

  #search for office in Moscow
  def nonresid_moscow
    @search_condition = SearchCondition.new()
    @search_condition.locality = "Москва"
  end

  #search for office in MO
  def nonresid_mo
    @search_condition = SearchCondition.new()
  end

  #search for suburban
  def suburban
    @search_condition = SearchCondition.new()
  end




  def old
  end

  def find
  end

  def result
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end

  def result_flat
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @search_condition.locality = "Москва"
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
    @search_condition.administrative_area = "Московская область"
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
    @search_condition.administrative_area = "Московская область"
    @qs = @search_condition.get_sql_condition
    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE
  end



end
