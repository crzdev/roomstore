class AddDistanceToMkadToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :distance_to_mkad, :integer
  end

  def self.down
    remove_column :entries, :distance_to_mkad
  end
end
