#some methods for working with address model
class AddressHelper
  #checks if AddressText object can be resolved by our DB
  def self.is_resolved_by_db? address_text
    #we have variants of good address when : 
    #address consists of Country, Locality, Street 
    #address consists of Country, Administrative Area, Street
    #address consists of Country, Administrative Area, Sub Administrative Area, Locality, Street
    
    result = false

    if address_text.administrative_area != nil && 
        address_text.administrative_area != "" &&
      address_text.sub_administrative_area != nil && 
        address_text.sub_administrative_area != "" &&
      address_text.locality != nil && 
        address_text.locality != "" &&
       address_text.street != nil && 
        address_text.street != "" 
    end

    
    if  address_text.locality != nil && 
        address_text.locality != "" &&
        address_text.street != nil && 
        address_text.street != "" 
    end

    if address_text.administrative_area != nil && 
        address_text.administrative_area != "" &&
        address_text.locality != nil && 
        address_text.locality != "" &&
        address_text.street != nil && 
        address_text.street != "" 
    end
    
=begin    
    if address_text.administrative_area != nil && address_text.administrative_area != ""
      aa = AdministrativeArea.find_by_name(address_text.administrative_area)
      if aa
        if address_text.sub_administrative_area != nil && address_text.sub_administrative_area != ""        
          saa = SubAdministrativeArea.find_by_name(address_text.sub_administrative_area)
          if saa
            if address_text.locality != nil && address_text.locality != ""
              locality = Locality.find_by_name(address_text.locality)
              if locality
                if address_text.street != nil && address_text.street != ""
                  street = Street.find_by_name(address_text.street)
                  if street
                    #address fully resolved
                    result = true
                  end
                end
              end
            end
          end
      end
    end
=end
    result
  end
  
  #checks if AddressText object can be resolved by Yandex Maps server
  #method returns true only if address in string format is same as
  #text field of FIRST GeoObject in yandex xml response
  def self.is_resolved_by_ym? address_text
    ymml = Yms.geocode address_text.get_address_string
    yandex_maps_address_string = Yms.get_address_string ymml
    yandex_maps_address_string == address_text.get_address_string 
  end

  #same as method above, but it uses address_string instead of address_text object
  def self.is_address_string_resolved_by_ym? address_string
    ymml = Yms.geocode address_string
    yandex_maps_address_string = Yms.get_address_string ymml
    yandex_maps_address_string == address_string
  end


  #returns AddressText objects that represents yandex's geocoder variants of address
  #todo: incapsulate query and response to YMS in Object
  def self.get_variants_for address_text
    xml = Yms.geocode address_text.get_address_string
    get_address_texts xml
  end

  #builds Address model object for passed address_text object 
  #all geo objects builded too if needed
  def self.build_model_for address_text
    #if address_text.street or address_text.premise or address_text.locality  == "" or nil return with error
    #if address_text.sub_administrative_area and address_text.administrative_area == nil return with error
    if (address_text.street == "" or address_text.street == nil or address_text.premise == "" or address_text.premise == nil or address_text.locality == "" or address_text.locality == nil)
      Ml.w "cant create Model for AddressText becouse street premise and locailty must be not empty"
      return nil
    end

    if address_text.sub_administrative_area and ( address_text.administrative_area == nil or address_text.administrative_area == "" )
      Ml.w "cant create Model for AddressText becouse sub administrative area can not be without administrative area "
      return nil
    end
    
    #todo: those if-elses are so UGLY :(
    if address_text.administrative_area != nil && address_text.administrative_area != ""
      Ml.w "Administrative Area field in not empty"
      Ml.w "Going to check our DB for #{address_text.administrative_area}"
      if aa = AdministrativeArea.find_by_name(address_text.administrative_area)
        Ml.w "aa #{aa.name} founded in our DB"
        if address_text.sub_administrative_area != nil && sub_address_text.administrative_area != ""
          Ml.w "Sub Administrative Area field in not empty"
          if saa = SubAdministrativeArea.find(:first, :conditions => { :name => address_text.sub_administrative_area, :administrative_area_id => aa.id})
            Ml.w "saa #{saa.name} founded in our DB"
            if locality = Locality.find(:first, :conditions => { :name => address_text.locality, :sub_administrative_area_id => saa.id})
              Ml.w "locality #{locality.name} founded in our DB"
              if street = Street.find(:first,:conditions => { :name => address_text.street, :locality_id => locality.id})
                Ml.w "street #{street.name} founded in our DB"
                new_address = Address.new(:street_id => street.id, :premise => address_text.premise)
              else
                Ml.w "street #{addres_text.street} IS NOT in our DB"
                new_street = locality.streets.build (:name => address_text.street)
                new_street.save
                new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
              end
            else
              Ml.w "locality #{address_text.locality} IS NOT in our DB"
              new_locality = saa.localities.build (:name => address_text.locality)
              new_locality.save
              new_street = new_locality.streets.build (:name => address_text.street)
              new_street.save
              new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
            end
          else
            Ml.w "saa #{address_text.sub_administrative_area} IS NOT in our DB"
            new_saa = aa.sub_administrative_areas.build (:name => address_text.sub_administrative_area)
            new_saa.save
            new_locality = new_saa.localities.build (:name => address_text.locality)
            new_locality.save
            new_street = new_locality.streets.build (:name => address_text.street)
            new_street.save
            new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
          end
        else
          Ml.w "Sub Administrative Area field IS empty"
          if locality = Locality.find(:first, :conditions => { :name => address_text.locality, :administrative_area_id => aa.id})
            Ml.w "locality #{locality.name} founded in our DB"
            if street = Street.find(:first,:conditions => { :name => address_text.street, :locality_id => locality.id})
              Ml.w "street #{street.name} founded in our DB"
              new_address = Address.new(:street_id => street.id, :premise => address_text.premise)
            else
              Ml.w "street #{addres_text.street} IS NOT in our DB"
              new_street = locality.streets.build (:name => address_text.street)
              new_street.save
              new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
            end
          else
            Ml.w "locality #{address_text.locality} IS NOT in our DB"
            new_locality = aa.localities.build (:name => address_text.locality)
            new_locality.save
            new_street = new_locality.streets.build (:name => address_text.street)
            new_street.save
            new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
            new_address.save
          end
        end
      else
        Ml.w "aa: #{address_text.administrative_area} IS NOT in our DB"
        Ml.w "Going to build AdministrativeArea object"
        new_aa = AdministrativeArea.new (:name => address_text.administrative_area)
        #todo: add save check
        new_aa.save
        Ml.w "Administrative Area object #{new_aa} saved"
        if address_text.sub_administrative_area != nil && sub_address_text.administrative_area != ""
          Ml.w "Sub Administrative Area field is NOT empty"
          new_saa = new_aa.sub_administrative_areas.build (:name => address_text.sub_administrative_area)
          new_saa.save
          new_locality = new_saa.localities.build (:name => address_text.locality)
          new_locality.save
          new_street = new_locality.streets.build (:name => address_text.street)
          new_street.save
          new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
        else
          Ml.w "Sub Administrative Area field IS empty"
          new_locality = new_aa.localities.build (:name => address_text.locality)
          new_locality.save
          new_street = new_locality.streets.build (:name => address_text.street)
          new_street.save
          new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
        end
      end
    else
      Ml.w "address_text have no information about administrative area"
      Ml.w "Asumption: this is Moscow or moscowlike city"
      if locality = Locality.find(:first, :conditions => "name = '#{address_text.locality}' AND administrative_area_id is NULL AND sub_administrative_area_id is NULL")
        Ml.w "Locality #{locality.name} is in our DB"
        if street = Street.find(:first,:conditions => { :name => address_text.street, :locality_id => locality.id})
          Ml.w "street #{street.name} founded in our DB"
          new_address = Address.new(:street_id => street.id, :premise => address_text.premise)
        else
          Ml.w "street #{address_text.street} IS NOT in our DB"
          new_street = locality.streets.build (:name => address_text.street)
          new_street.save
          new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
        end
      else
        Ml.w "Locality #{address_text.locality} is NOT in our DB"
        new_locality = Locality.new(:name => address_text.locality)
        new_locality.save
        new_street = new_locality.streets.build (:name => address_text.street)
        new_street.save
        new_address = Address.new(:street_id => new_street.id, :premise => address_text.premise)
      end
    end
  end

  
  #parses YandexMaps XML respons and returns array of AddressText objects
  #todo: exclude subways stations ( use <kind> tag to determine )
  def self.get_address_texts ymml
    result = []
    doc = REXML::Document.new(ymml)
    #each address variant
    doc.elements.each("ymaps/GeoObjectCollection/featureMember/GeoObject/metaDataProperty/GeocoderMetaData/AddressDetails/") do |el|
      puts "parsing address in xml"
      doc2 = REXML::Document.new el.to_s
      doc2.elements["CountryName"]
      new_address_text = AddressText.new

      if doc2.elements["//CountryName"] != nil
        new_address_text.country = doc2.elements["//CountryName"].text 
      end

      if doc2.elements["//AdministrativeAreaName"] != nil
        new_address_text.administrative_area =  doc2.elements["//AdministrativeAreaName"].text 
      end

      if doc2.elements["//SubAdministrativeAreaName"]    != nil  
        new_address_text.sub_administrative_area = doc2.elements["//SubAdministrativeAreaName"].text 
      end

      if doc2.elements["//LocalityName"] != nil
        new_address_text.locality = doc2.elements["//LocalityName"].text 
      end
      if doc2.elements["//PremiseNumber"] != nil
        new_address_text.premise = doc2.elements["//PremiseNumber"].text 
      end
      if doc2.elements["//ThoroughfareName"] != nil
        new_address_text.street = doc2.elements["//ThoroughfareName"].text 
      end
      result << new_address_text
    end
    result
  end

  #returns first variant of address in string format ( "Russia, Moscow, street Blah, 4" )
 def self.get_address_string ymml
    doc = REXML::Document.new(ymml)
    doc.elements["ymaps/GeoObjectCollection/featureMember/GeoObject/metaDataProperty/GeocoderMetaData/text"].text
  end



end
