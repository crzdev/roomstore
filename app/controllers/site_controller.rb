class SiteController < ApplicationController
	#start page
  def index
    if User.find_by_id(session[:user_id])
      flash[:notice] = "Вы уже в системе"
    else
      flash[:notice] = "Нужно авторизоваться. Попробуйте Login: user и Password: user"
    end					 
    redirect_to :controller => :users, :action => :login				
  end

  def authorize
  end
  def search
  end

end
