class RemoveOldTables < ActiveRecord::Migration
  def self.up
    drop_table :cities
    drop_table :mo_districts
  end

  def self.down
    create_table :cities do |t|
      t.string :name
      t.timestamps
    end

    create_table :mo_districts do |t|
      t.string :name
      t.timestamps
    end
  end
end
