class Locality < ActiveRecord::Base
  belongs_to :administrative_area
  belongs_to :sub_administrative_area
  has_many: :streets
end
