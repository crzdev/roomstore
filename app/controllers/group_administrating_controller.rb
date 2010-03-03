class GroupAdministratingController < ApplicationController

  def index
    @curent_user = GroupAdministrator.find_by_id(session[:user_id])
    @users = @curent_user.simple_users
    @group = @curent_user.group
  end



  def new_user
  end

  def edit_user
  end

  def delete_user
  end

  def new_group
  end

  def edit_group
  end

  protected
  def authorize
    unless GroupAdministrator.find_by_id(session[:user_id])
      flash[:notice] = "Вы должны быть администратором группы для доступа к этой странице"
      redirect_to :controller => :users, :action => :login
    end
  end

end
