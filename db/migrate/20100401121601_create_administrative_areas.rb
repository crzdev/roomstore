class CreateAdministrativeAreas < ActiveRecord::Migration
  def self.up
    create_table :administrative_areas do |t|
      t.integer :name

      t.timestamps
    end
  end

  def self.down
    drop_table :administrative_areas
  end
end
