class Address < ActiveRecord::Base
  has_one :entry
  has_one :street
  has_one :locality
  has_one :administrative_area
  has_one :sub_administrative_area

  validates_presence_of :street
  validates_presence_of :premise
  
end
