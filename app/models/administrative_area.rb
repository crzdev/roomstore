class AdministrativeArea < ActiveRecord::Base
  has_many :localities
  has_many :sub_administrative_areas
  has_many :cities

  def self.get_mo_sub_administrative_areas
    mo_aa = self.find(:first,:conditions => {:name => "Московская область"})
    if mo_aa
      mo_aa.sub_administrative_areas
    end
    []
    else
  end
end
