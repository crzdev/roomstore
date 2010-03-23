class Street < ActiveRecord::Base
  belongs_to :locality
  belongs_to :address
end
