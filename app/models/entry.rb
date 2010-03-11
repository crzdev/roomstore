class Entry < ActiveRecord::Base
  belongs_to :user
  
  has_many :subway_stations, :through => :entries_subway_stations, :dependent => :destroy
  has_many :entries_subway_stations, :class_name => "EntriesSubwayStations"

end
