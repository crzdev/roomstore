class CreateHighways < ActiveRecord::Migration
  def self.up
    create_table :highways do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :highways
  end
end
