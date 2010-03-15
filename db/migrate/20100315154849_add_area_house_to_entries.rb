class AddAreaHouseToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :area_house, :integer
  end

  def self.down
    remove_column :entries, :area_house
  end
end
