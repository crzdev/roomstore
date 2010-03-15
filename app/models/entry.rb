class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :mo_district
  
  has_many :subway_stations, :through => :entries_subway_stations, :dependent => :destroy
  has_many :entries_subway_stations, :class_name => "EntriesSubwayStations"

  has_many :highways, :through => :entries_highways, :class_name => "Highway", :dependent => :destroy
  has_many :entries_highways, :class_name => "EntriesHighways"

end
