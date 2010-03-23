class SubAdministrativeArea < ActiveRecord::Base
  has_many :localities
  has_many :streets, :through => :localities
  belongs_to :administrative_area
  belongs_to :address
end
