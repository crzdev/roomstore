class Address < ActiveRecord::Base
  belongs_to :entry
  has_many :streets
  has_many :localities
  has_one :administrative_area
  has_one :sub_administrative_area
end
