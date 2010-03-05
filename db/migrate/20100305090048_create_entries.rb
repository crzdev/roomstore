class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :type
      t.integer :rooms_count
      t.decimal :rent_price
      t.string :city
      t.string :street
      t.string :house_number
      t.integer :flat_number
      t.integer :floor_number
      t.string :disctrict
      t.integer :area_total
      t.integer :area_kitchen
      t.integer :rent_time
      t.text :contacts
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
