class PersonalAreaController < ApplicationController
#  layout  "personal_area"
  def index
    @user = User.find_by_id(session[:user_id])
  end

  def my_entries
    @user = User.find_by_id(session[:user_id])
    @entries = @user.entries
  end

  def new_entry
  end
  def new_rent_entry
    @entry = RentEntry.new
    @entry.user_id = session[:user_id]
  end

  def personal_info
  end
end
