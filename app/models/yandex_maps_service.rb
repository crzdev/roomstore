require 'net/http'
require 'rexml/document'

class YandexMapsService

  @@api_key = "AEFdp0sBAAAA0WdUeQMA_NsZI7TWB5uGwhAe2x0loYDZv9cAAAAAAAAAAABEdNRbcM2ehs_GYcuPjFu2cfZs-Q=="
  # http://geocode-maps.yandex.ru/1.x/?geocode=STRING&key=KEY
  @@service_url = "http://geocode-maps.yandex.ru/1.x/?"
  @@max = 5 #number of variants in answer of YM service
  #returns xml returned by YandexMaps geocoder
  def self.geocode address_string
    url = "#{@@service_url}geocode=#{address_string}&key=#{@@api_key}"
    enc_url = URI.escape url
    # get the XML data as a string
    Net::HTTP.get_response(URI.parse(enc_url)).body
  end

  #parses YandexMaps XML respons and returns array of AddressText objects
  #todo: make a class for parsing xmls
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
