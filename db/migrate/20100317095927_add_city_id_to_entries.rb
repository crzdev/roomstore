class AddCityIdToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :city_id, :integer
  end

  def self.down
  end
end
