class Locality < ActiveRecord::Base
  has_many :streets
  belongs_to :administrtative_area
  belongs_to :sub_administrtative_area
end
