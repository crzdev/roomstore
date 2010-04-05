class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :street_id
      t.string :premise

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
