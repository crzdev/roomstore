class CreateStreets < ActiveRecord::Migration
  def self.up
    create_table :streets do |t|
      t.integer :locality_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :streets
  end
end
