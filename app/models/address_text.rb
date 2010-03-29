#class represents Address model in text: all fields are strings 
#in exchange of ids
class AddressText
  attr_accessor :country
  attr_accessor :administrative_area
  attr_accessor :sub_administrative_area
  attr_accessor :locality
  attr_accessor :street
  attr_accessor :premise
  
#returns address in string format  ( "Russia, Moscow, street Blah, 4" )

  def get_address_string
    address_string = ""

    if country && country != ""
      #      address_string += country += ", "
      address_string += country
      address_string += ", "
    end

    if administrative_area && administrative_area != ""
      address_string += administrative_area
      address_string += ", "
    end

    if sub_administrative_area && sub_administrative_area != ""
      address_string += sub_administrative_area 
      address_string += ", "
    end

    if locality && locality != ""
      address_string += locality
      address_string += ", "
    end

    if street && street != ""
      address_string += street
      address_string  += ", "
    end

    if premise && premise != ""
      address_string += premise
      address_string  += ", "
    end

  #slice last ", "

  address_string.slice!(address_string.length-2..address_string.length)
  address_string

end
end
 
