class AddPemiseColumnToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :premise, :string
  end

  def self.down
    remove_column :addresses, :premise
  end
end
