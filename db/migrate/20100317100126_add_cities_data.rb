class AddCitiesData < ActiveRecord::Migration
  def self.up
    City.new(:name => "Москва")
    City.new(:name => "Московская Область")
  end

  def self.down
  end
end
