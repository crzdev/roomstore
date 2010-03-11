class CreateEntriesSubwayStations < ActiveRecord::Migration
  def self.up
    create_table :entries_subway_stations do |t|
      t.integer :subway_station_id
      t.integer :entry_id
      t.integer :time_to

      t.timestamps
    end
  end

  def self.down
    drop_table :entries_subway_stations
  end
end
