class Entry < ActiveRecord::Base
  belongs_to :user
  
  has_many :subway_stations, :through => :entries_subway_stations, :dependent => :destroy
  has_many :entries_subway_stations, :class_name => "EntriesSubwayStations"

  has_many :highways, :through => :entries_highways, :class_name => "Highway", :dependent => :destroy
  has_many :entries_highways, :class_name => "EntriesHighways"

  REALTY_TYPES = [
                   # Displayed stored in db
                   [ "Check" , "check" ],
                   [ "Credit card" , "cc" ],
                   [ "Purchase order" , "po" ]
                  ]
end
