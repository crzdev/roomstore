class SiteController < ApplicationController
	#start page
  def index
			if User.get_by_id(session[:user_id])
				 flash[:notice] = "Вы уже в системе"
			end					 
							 		 redirect_to :controller => :users, :action => :login				
  end

  def search
  end

end
