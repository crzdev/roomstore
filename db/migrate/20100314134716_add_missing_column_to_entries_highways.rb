class AddMissingColumnToEntriesHighways < ActiveRecord::Migration
  def self.up
    add_column :entries_highways, :entry_id, :integer
    add_column :entries_highways, :highway_id, :integer
    add_column :entries_highways, :time_to, :integer
  end

  def self.down
  end
end
