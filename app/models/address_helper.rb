#some methods for working with address model
class AddressHelper
  #checks if AddressText object can be resolved by our DB
  def self.is_resolved_by_db? address_text
    
  end
  
  #checks if AddressText object can be resolved by Yandex Maps server
  #method returns true only if address in string format is same as
  #text field of FIRST GeoObject in yandex xml response
  def self.is_resolved_by_ym? address_text
    ymml = Yms.geocode address_text.get_address_string
    yandex_maps_address_string = Yms.get_address_string ymml
    yandex_maps_address_string == address_text.get_address_string 
  end

  #returns AddressText objects that represents yandex's geocoder variants of address
  def self.get_variants_for address_text
  end

  #builds Address model object for passed address_text object 
  #all geo objects builded too if needed
  def self.build_model_for address_text
  end


end
