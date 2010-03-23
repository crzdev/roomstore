class AdministrativeArea < ActiveRecord::Base
  has_many :sub_administrative_areas
  has_many :localities, :through => :sub_administrative_areas
  belongs_to :address
end
