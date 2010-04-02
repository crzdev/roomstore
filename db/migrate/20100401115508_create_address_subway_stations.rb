class CreateAddressSubwayStations < ActiveRecord::Migration
  def self.up
    create_table :address_subway_stations do |t|
      t.integer :address_id
      t.integer :subway_station_id
      t.integer :time_to

      t.timestamps
    end
  end

  def self.down
    drop_table :address_subway_stations
  end
end
