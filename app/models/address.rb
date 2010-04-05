class Address < ActiveRecord::Base
  belongs_to :street
  has_one :entry
end
