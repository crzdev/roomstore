class OldsiteController < ApplicationController

  def new_entry_start
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
