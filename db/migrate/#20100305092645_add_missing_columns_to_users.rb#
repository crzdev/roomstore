class AddMissingColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string
    add_column :users, :surname, :string
  end

  def self.down
    remove_column :users, :login, :string
    remove_column :users, :surname, :string
  end
end
