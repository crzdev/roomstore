class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :administrative_area_id
      t.integer :sub_administrative_area_id
      t.integer :locality_id
      t.integer :street_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
