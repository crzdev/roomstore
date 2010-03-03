class GroupAdministrator < User
  #searche for all simple users that belongs to same group as curent Group Admin
  has_one :group, :foreign_key => :user_id 
  def simple_users
    SimpleUser.find(:all,:conditions => "group_id = #{group_id}")
  end
end
