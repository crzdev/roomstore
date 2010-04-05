class Address < ActiveRecord::Base
  belongs_to :street
  has_one :entry

  has_many :address_subway_stations
  has_many :address_highways

  has_many :subway_stations, :through => :address_subway_stations
  has_many :highways, :through => :address_highways

end
