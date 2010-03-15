class AddRentTimeTypeToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :rent_time_type, :string
  end

  def self.down
  end
end
