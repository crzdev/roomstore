class SearchCondition
  #todo add accessors for all columns
  attr_accessor :city
  attr_accessor :street
  attr_accessor :rooms_count

  def initialize (args = {})
    @city = args[:city]
    @street = args[:street]
    @rooms_count = args[:rooms_count]
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
      
     if rooms_count != ""
       result.update ({"rooms_count" => rooms_count})
     end
     result
  end


end
