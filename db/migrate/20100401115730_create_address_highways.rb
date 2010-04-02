class CreateAddressHighways < ActiveRecord::Migration
  def self.up
    create_table :address_highways do |t|
      t.integer :address_id
      t.integer :highway_id
      t.decimal :distance_to_mkad

      t.timestamps
    end
  end

  def self.down
    drop_table :address_highways
  end
end
