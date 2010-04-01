class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :login
      t.string :hashed_password
      t.string :salt
      t.string :type
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
