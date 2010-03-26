class CreateLocalities < ActiveRecord::Migration
  def self.up
    create_table :localities do |t|
      t.string :name
      t.integer :sub_administrative_area_id
      t.integer :administrative_area_id

      t.timestamps
    end
  end

  def self.down
    drop_table :localities
  end
end