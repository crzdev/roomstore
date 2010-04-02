class CreateSubAdministrativeAreas < ActiveRecord::Migration
  def self.up
    create_table :sub_administrative_areas do |t|
      t.integer :name
      t.integer :administrative_area_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_administrative_areas
  end
end
