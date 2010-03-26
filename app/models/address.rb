class Address < ActiveRecord::Base
  belongs_to :entry
  has_one :street
  has_one :locality
  has_one :administrative_area
  has_one :sub_administrative_area
end
