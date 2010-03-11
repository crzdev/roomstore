class SubwayStation < ActiveRecord::Base
  
  has_many :entries_subway_stations, :class_name => "EntriesSubwayStations"
  has_many :entries, :through => :entries_subway_stations

  validates_uniqueness_of     :name
end
