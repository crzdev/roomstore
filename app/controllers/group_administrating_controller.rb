class GroupAdministratingController < ApplicationController
  
  #add check that operating user and group belongs to curent user

  def index
    @curent_user = GroupAdministrator.find_by_id(session[:user_id])
    @simple_users = @curent_user.simple_users
    @group = @curent_user.group
  end



  def new_user
    @simple_user = SimpleUser.new
    @simple_user.group_id = GroupAdministrator.find_by_id(session[:user_id]).group_id
  end

  def edit_user
    @simple_user = SimpleUser.find(params[:id])
    if can_access_user
    end
  end


  def show_user
    @user = SimpleUser.find(params[:id])
    if can_access_user
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end

  def new_group
  end

  def edit_group
  end

  def create_user
    @simple_user = SimpleUser.new(params[:simple_user])
    @simple_user.group_id = User.find_by_id(session[:user_id]).group_id
    #    @user.type = params[:user][:type]
    respond_to do |format|
      if @simple_user.save
        flash[:notice] = "User #{@simple_user.login} was successfuly created."
        format.html { redirect_to(:action=>:index) }
        format.xml  { render :xml => @simple_user, :status => :created, :location => @user }
      else
        format.html { render :action => "new_user" }
        format.xml  { render :xml => @simple_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_user
    @simple_user = SimpleUser.find(params[:id])
    if can_access_user 
      respond_to do |format|
        if @simple_user.update_attributes(params[:simple_user])
          flash[:notice] = "User #{@simple_user.login} was successfuly created."
          format.html { redirect_to(:action => :index) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit_user" }
          format.xml  { render :xml => @simple_user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def destroy_user
    @user = SimpleUser.find(params[:id])
    if can_access_user 
      @user.destroy
      respond_to do |format|
        format.html { redirect_to(:action => "index") }
        format.xml  { head :ok }
      end
    end
  end


  protected
  def authorize
    unless GroupAdministrator.find_by_id(session[:user_id])
      flash[:notice] = "Вы должны быть администратором группы для доступа к этой странице"
      redirect_to :controller => :users, :action => :login
    end
  end

  #if no group exists for current user redirect to index with flash
  def can_access_user
    simple_user = SimpleUser.find_by_id(params[:id])
    curent_user = GroupAdministrator.find_by_id(session[:user_id])
    if simple_user.group_id != curent_user.group_id
      flash[:notice] = "You can't edit this user"
      redirect_to :action => "index"
      false
    else
      true
    end
  end

  def grp_check
    user = GroupAdministrator.find_by_id(session[:user_id])
    if user.group == nil
      flash[:notice] = "У вас нет группы, создайте её сперва"
      redirect_to :action => "index"
    end
  end

end
