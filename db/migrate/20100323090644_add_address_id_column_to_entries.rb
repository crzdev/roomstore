class AddAddressIdColumnToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :address_id, :integer
  end

  def self.down
    add_column :entries, :address_id
  end
end
