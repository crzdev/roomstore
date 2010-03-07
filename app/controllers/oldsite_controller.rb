# -*- coding: utf-8 -*-

class OldsiteController < ApplicationController

  def search
    redirect_to :controller => "search", :action => "old"
  end

  def home_page
  end

  def personal_page
  end

  def new_entry
  end

	#entry point
  def index
    redirect_to :action => :home_page				
  end

end
