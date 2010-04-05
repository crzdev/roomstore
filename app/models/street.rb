class Street < ActiveRecord::Base
  belongs_to :locality
  has_many :addresses
end
