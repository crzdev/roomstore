# -*- coding: utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "old_site"
  before_filter :authorize, :except => :login
  session :session_key => '_roomstore_session_id'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Необходима авторизация"
      redirect_to :controller => :users, :action => :login
    end
  end

end
