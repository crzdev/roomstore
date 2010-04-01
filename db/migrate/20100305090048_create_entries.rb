class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :type
      t.integer :rooms_count
      t.decimal :price
      t.string :currency
      t.decimal :price_type
      t.integer :floors_total
      t.integer :floor_number
      t.integer :area_total
      t.integer :area_kitche
      t.integer :house_area
      t.integer :plot_area
      t.integer :rent_time_type
      t.integer :user_id
      t.integer :address_id
      t.string :realty_type
      t.decimal :commission_client
      t.decimal :commission_agent
      t.boolean :phone
      t.boolean :refridgerator
      t.boolean :tv
      t.boolean :washing_machine
      t.text :contacts
      t.text :comment


      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
