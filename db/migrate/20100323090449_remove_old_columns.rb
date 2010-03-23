class RemoveOldColumns < ActiveRecord::Migration
  def self.up
    remove_column :entries, :city
    remove_column :entries, :city_id
    remove_column :entries, :house_number
    remove_column :entries, :flat_number
    remove_column :entries, :disctrict #ololo
    remove_column :entries, :mo_district_id
  end

  def self.down
    add_column :entries, :city, :string
    add_column :entries, :city_id, :integer
    add_column :entries, :house_number, :integer
    add_column :entries, :flat_number, :integer
    add_column :entries, :disctrict, :string
    add_column :entries, :mo_district_id, :integer
  end
end
