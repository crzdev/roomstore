class Highway < ActiveRecord::Base
  has_many :address_highways
  has_many :addresses, :through => :address_highways
end
