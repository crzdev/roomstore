class OldsiteController < ApplicationController
  def search
  end

  def home_page
  end

  def new_entry
  end

	#start page
  #тупо редирект на логин. Без авторизации нельзя пользоваться системой.
  def index
    if User.find_by_id(session[:user_id])
      flash[:notice] = "Вы уже в системе"
    else
      flash[:notice] = "Нужно авторизоваться. Попробуйте Login: user и Password: user"
    end					 
    redirect_to :controller => :users, :action => :login				
  end
  #bloack of general authorize from ApplicationController 
  def authorize
  end


end
