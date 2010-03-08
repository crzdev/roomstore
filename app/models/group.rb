class Group < ActiveRecord::Base
  belongs_to :admin, :class_name => "User",  :foreign_key => :group_id ,:dependent => :destroy
  has_many :simple_users , :dependent => :destroy
  def admin
    GroupAdministrator.find(:first,:conditions => "group_id = #{id}")
  end
end
