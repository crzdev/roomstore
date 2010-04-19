class AdministrativeArea < ActiveRecord::Base
  has_many :localities
  has_many :sub_administrative_areas
  has_many :cities
end
