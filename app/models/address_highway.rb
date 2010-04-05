class AddressHighway < ActiveRecord::Base
  belongs_to :address
  belongs_to :highway
end
