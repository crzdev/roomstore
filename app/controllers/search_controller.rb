class SearchController < ApplicationController
  def new
    @search_condition = SearchCondition.new()
  end

  def find
  end

  def result
    
    @qs = "" #query_string todo: remove in production
    @search_condition = SearchCondition.new(params[:search_condition])
    @search_condition.get_hash.each_pair {|key,value|
      @qs += "#{key} = '#{value}' AND "
    }

    #slice last " AND "
    if @qs != ""
      @qs.slice!(@qs.length-5..@qs.length)
    end

    @entries = Entry.find(:all,:conditions => @qs) #todo: SQLINJECTIONABLE

    #    @entries = Entry.find(:all,:conditions => ["city = ? AND street = ? AND rooms_count = ?",
    #                                            @search_condition.city,
    #                                            @search_condition.street,
    #                                            @search_condition.rooms_count]
    #                      );
  end

end
