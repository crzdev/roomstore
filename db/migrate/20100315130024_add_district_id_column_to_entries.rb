class AddDistrictIdColumnToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :mo_district_id, :integer
  end

  def self.down
  end
end
