require 'rexml/document'
class YMapsMLParser
  
  #parses YandexMaps XML respons and returns array of AddressText objects
  def self.get_address_texts ymml
    Address[] result = []

    doc = REXML::Document.new(ymml)
    #each address variant
    doc.elements.each("ymaps/GeoObjectCollection/featureMember/GeoObject/metaDataProperty/GeocoderMetaData/AddressDetails/") do |el|
      el.to_a("//ConunteryName")
      el.to_a("//AdministrativeAreaName")
      el.to_a("//SubAdministrativeAreaName")
      el.to_a("//LocalityName")
      el.to_a("//LocalityName")
      el.to_a("//ThoroughfareName")
    end
    
  end

end
