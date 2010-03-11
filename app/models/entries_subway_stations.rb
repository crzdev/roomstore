class EntriesSubwayStations < ActiveRecord::Base
  belongs_to :entry
  belongs_to :subway_station
end
