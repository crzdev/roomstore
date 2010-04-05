class SubwayStation < ActiveRecord::Base
  
  has_many :address_subway_stations, :class_name => "AddressSubwayStations"
  has_many :address, :through => :address_subway_stations

  validates_uniqueness_of     :name
end
