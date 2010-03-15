class CreateMoDistricts < ActiveRecord::Migration
  def self.up
    create_table :mo_districts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mo_districts
  end
end
