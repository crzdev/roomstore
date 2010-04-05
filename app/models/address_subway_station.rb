class AddressSubwayStation < ActiveRecord::Base
  belongs_to :address
  belongs_to :subway_station
end
