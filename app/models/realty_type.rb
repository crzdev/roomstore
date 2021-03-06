class RealtyType
  @@REALTY_TYPES = [
                  # Displayed stored in db
                  [ "комната" , "room" ],
                  [ "квартира" , "flat" ],
                  [ "оффис" , "office" ],
                  [ "торговая площадка" , "trading_floor" ],
                  [ "склад" , "warehouse" ],
                  [ "общепит" , "catering" ],
                  [ "своб. назн." , "free_app" ],
                  [ "гараж" , "garage" ],
                  [ "под производство" , "manufacture" ],
                  [ "юр. адрес" , "legal_address" ],
                  [ "под автосервис" , "autoservice" ],
                  [ "продажа бизнеса" , "selling_business" ],
                  [ "дом" , "house" ],
                  [ "часть дома" , "part_of_house" ],
                  [ "участок" , "plot" ],
                  [ "таунхаус" , "townhouse" ]
                 ]
  @@NONRESIDENTIAL_REALTY_TYPES = [
                                 # Displayed stored in db
                                 [ "оффис" , "office" ],
                                 [ "торговая площадка" , "trading_floor" ],
                                 [ "склад" , "warehouse" ],
                                 [ "общепит" , "catering" ],
                                 [ "своб. назн." , "free_app" ],
                                 [ "гараж" , "garage" ],
                                 [ "под производство" , "manufacture" ],
                                 [ "юр. адрес" , "legal_address" ],
                                 [ "под автосервис" , "autoservice" ],
                                 [ "продажа бизнеса" , "selling_business" ]
                                ]
  @@URBAN_REALTY_TYPES = [
                        # Displayed stored in db
                        [ "комната" , "room" ],
                        [ "квартира" , "flat" ]
                       ]
  @@SUBURBAN_REALTY_TYPES = [
                           # Displayed stored in db
                           [ "дом" , "house" ],
                           [ "часть дома" , "part_of_house" ],
                           [ "участок" , "plot" ],
                           [ "таунхаус" , "townhouse" ]
                          ]


  def self.get_all_types
    @@NONRESIDENTIAL_REALTY_TYPES + @@URBAN_REALTY_TYPES + @@SUBURBAN_REALTY_TYPES 
  end

  def self.get_urban_types
    @@URBAN_REALTY_TYPES
  end

  def self.get_suburban_types
    @@SUBURBAN_REALTY_TYPES 
  end

  def self.get_office_types
    @@NONRESIDENTIAL_REALTY_TYPES 
  end

  def self.get_nonresidential_types
    @@NONRESIDENTIAL_REALTY_TYPES 
  end

  #returns type name for value that stored in database
  def self.get_name_for (value)
    result = ""
    get_all_types.collect { |el| 
      if el[1] == value
        result = el[0]
      end
    }
    result
  end

end		
