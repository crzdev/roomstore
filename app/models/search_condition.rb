#attrs names must be same as colomun names in entries table
class SearchCondition
  attr_accessor :city
  attr_accessor :mo_districts
  attr_accessor :highways
  attr_accessor :street
  attr_accessor :rooms_count
  attr_accessor :min_price
  attr_accessor :max_price
  attr_accessor :min_distance_to_mkad
  attr_accessor :max_distance_to_mkad
  attr_accessor :min_area_house
  attr_accessor :max_area_house
  attr_accessor :min_area_plot
  attr_accessor :max_area_plot
  attr_accessor :tv
  attr_accessor :refridgerator
  attr_accessor :washing_machine
  attr_accessor :phone
  attr_accessor :furniture
  attr_accessor :total_area
  attr_accessor :kitchen_area
  attr_accessor :live_area
  attr_accessor :rent_time_type
  attr_accessor :realty_types
  attr_accessor :nearest_subway_stations
  attr_accessor :time_to_nearest_subway_station
  attr_accessor :has_photo



  def initialize (args = {})
    @city = args[:city]
    @mo_districts = args[:mo_districts]
    @highways = args[:highways]
    @street = args[:street]
    @rooms_count = args[:rooms_count]
    @min_price = args[:min_price]
    @max_price = args[:max_price]
    @min_distance_to_mkad = args[:min_distance_to_mkad]
    @max_distance_to_mkad = args[:max_distance_to_mkad]
    @min_area_house = args[:min_area_house]
    @max_area_house = args[:max_area_house]
    @min_area_plot = args[:min_area_plot]
    @max_area_plot = args[:max_area_plot]
    @total_area = args[:total_area]
    @kitchen_area = args[:kitchen_area]
    @live_area = args[:live_area]
    @rent_time_type = args[:rent_time_type]
    @realty_types = args[:realty_types]
    @nearest_subway_stations = args[:nearest_subway_stations]
    @time_to_nearest_subway_station = args[:time_to_nearest_subway_station]
    @has_photo = args[:has_photo]
    @tv = args[:tv]
    @furniture = args[:furniture]
    @refridgerator = args[:refridgerator]
    @phone = args[:phone]
    @washing_machine = args[:washing_machine]
  end

  #more sofiscated method to get hash
  #returns hash with attribute => value pairs  
  def get_hash
    result = {}
    instance_variables.each { |var|
      if instance_variable_get(var) != "" && instance_variable_get(var) != nil
        result.update({var.slice(1..var.length) => instance_variable_get(var)})
      end
    }
    result
  end

  def get_sql_condition
    qs = "" #query_string 

    #building base query string
    get_hash.each_pair {|key,value|
      #parametrs below processed in another way
      if key !="min_price" && key != "max_price" && key != "has_photo" && key != "nearest_subway_stations" && key != "tv" && key != "furniture" && key != "washing_machine" && key != "phone"  && key != "refridgerator" && key != "total_area" && key != "kitchen_area" && key != "live_area" && key != "mo_districts" && key != "realty_types" && key != "min_distance_to_mkad" && key != "max_distance_to_mkad" && key != "min_area_house" && key != "max_area_house" && key != "min_area_plot" && key != "max_area_plot" && key != "highways"
        qs += "#{key} = '#{value}' AND "
      end
    }

    #adding price restrictions
    if min_price != "" && min_price != nil
      qs += "rent_price > '#{min_price}' AND "
    end

    if max_price != "" && max_price != nil
     qs += "rent_price < '#{max_price}' AND "
    end

    #adding distance to mkad restrictions
    if min_distance_to_mkad != "" && min_distance_to_mkad != nil
      qs += "distance_to_mkad > '#{min_distance_to_mkad}' AND "
    end

    if max_distance_to_mkad != "" && max_distance_to_mkad != nil
      qs += "distance_to_mkad < '#{max_distance_to_mkad}' AND "
    end

    #adding house area restrictions
    if min_area_house != "" && min_area_house != nil
      qs += "area_house > '#{min_area_house}' AND "
    end

    if max_area_house != "" && max_area_house != nil
     qs += "area_house < '#{max_area_house}' AND "
    end

    #adding plot area restrictions
    if min_area_plot != "" && min_area_plot != nil
      qs += "area_plot > '#{min_area_plot}' AND "
    end

    if max_area_plot != "" && max_area_plot != nil
      qs += "area_plot < '#{max_area_plot}' AND "
    end


    #adding area restriction
    #todo: add live_area restriction
    if total_area != "" && total_area != nil
      qs += "total_area > '#{total_area}' AND "
    end

    if kitchen_area != "" && kitchen_area != nil
      qs += "kitchen_area > '#{kitchen_area}' AND "
    end



    #adding photo restriction
    #todo: add code here

    #adding multiple subway stations
    if nearest_subway_stations != nil
      qs += "("
      nearest_subway_stations.each do |id|
        qs +="nearest_subway_station ='#{Metro.get_stations[id]}' OR "
      end
      #slice last " OR "
      if qs != ""
        qs.slice!(qs.length-4..qs.length)
      end
      qs +=") AND "
    end

    #adding multiple mo_districts
    if mo_districts != nil
      qs += "("
      mo_districts.each do |id|
        qs +="mo_district_id =#{id} OR "
      end
      #slice last " OR "
      if qs != ""
        qs.slice!(qs.length-4..qs.length)
      end
      qs +=") AND "
    end

    #adding multiple highways
    if highways != nil
      qs += "("
      highways.each do |id|
        qs +="highway_id =#{id} OR "
      end
      #slice last " OR "
      if qs != ""
        qs.slice!(qs.length-4..qs.length)
      end
      qs +=") AND "
    end

    #adding multiple realty_type
    if realty_types != nil
      qs += "("
      realty_types.each do |type|
        qs +="realty_type ='#{type}' OR "
      end
      #slice last " OR "
      if qs != ""
        qs.slice!(qs.length-4..qs.length)
      end
      qs +=") AND "
    end


    #adding attributes that represented with radio group with vlues "yes" "no" "no_mater" in view
    ("refridgerator,furniture,tv,phone,washing_machine".split(",")).each do |var| 
      value = instance_variable_get("@"+var)
      case value
            when "yes"
              qs += "#{var} = true AND "
            when "no"
              qs += "#{var} = false AND "
            when "no_mater"
              #donothing
            end
    end


    #slice last " AND "
    if qs != ""
      qs.slice!(qs.length-5..qs.length)
    end
    
    qs

  end

end
