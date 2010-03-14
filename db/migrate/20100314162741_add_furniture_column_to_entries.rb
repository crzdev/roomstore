class AddFurnitureColumnToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :furniture, :boolean
  end

  def self.down
    remove_column :entries, :furniture
  end
end
