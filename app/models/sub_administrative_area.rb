class SubAdministrativeArea < ActiveRecord::Base
  has_many :localities
  belongs_to :administrative_area
end
