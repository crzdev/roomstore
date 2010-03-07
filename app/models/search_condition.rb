class SearchCondition
  #todo add accessors for all columns
  attr_accessor :city
  attr_accessor :district
  attr_accessor :street
  attr_accessor :rooms_count
  attr_accessor :min_price
  attr_accessor :max_price
  attr_accessor :total_area
  attr_accessor :kitchen_area
  attr_accessor :live_area
  attr_accessor :rent_time
  attr_accessor :nearest_subway_stations
  attr_accessor :time_to_nearest_subway_station
  attr_accessor :has_photo



  def initialize (args = {})
    @city = args[:city]
    @district = args[:district]
    @street = args[:street]
    @rooms_count = args[:rooms_count]
    @min_price = args[:min_price]
    @max_price = args[:max_price]
    @total_area = args[:total_area]
    @kitchen_area = args[:kitchen_area]
    @live_area = args[:live_area]
    @rent_time = args[:rent_time]
    @nearest_subway_stations = args[:nearest_subway_stations]
    @time_to_nearest_subway_station = args[:time_to_nearest_subway_station]
    @has_photo = args[:has_photo]
  end

  #returns hash with attribute => value pairs
  def get_hash
    result = {}

    if city != ""
      result.update ({"city" => city})
    end

    if street != ""
      result.update ({"street" => street})
    end

    if district != ""
      result.update ({"district" => district})
    end
      
    if rooms_count != ""
      result.update ({"rooms_count" => rooms_count})
    end

    if rooms_count != ""
      result.update ({"rooms_count" => rooms_count})
    end
    if min_price != ""
      result.update ({"min_price" => min_price})
    end
    if max_price != ""
      result.update ({"max_price" => max_price})
    end
    if total_area != ""
      result.update ({"total_area" => total_area})
    end
    if kitchen_area != ""
      result.update ({"kitchen_area" => kitchen_area})
    end
    if live_area != ""
      result.update ({"live_area" => live_area})
    end
    if rent_time != ""
      result.update ({"rent_time" => rent_time})
    end
    if nearest_subway_stations != ""
      result.update ({"nearest_subway_stations" => nearest_subway_stations})
    end
    if time_to_nearest_subway_station != ""
      result.update ({"time_to_nearest_subway_station" => time_to_nearest_subway_station})
    end
    if has_photo != ""
      result.update ({"has_photo" => has_photo})
    end

     result
  end


end
