class Address < ActiveRecord::Base
  belongs_to :entry
  has_many: :streets
  has_many: :localities
  has_many: :administrative_areas
  has_many: :sub_administrative_areas
end
