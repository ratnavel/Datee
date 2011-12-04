class Admin::ApplicationController < ApplicationController
  before_filter :logged_in_as_admin?
  
  layout "admin"
  
  def logged_in_as_admin?
    unless current_user && current_user.is_admin
      flash[:notice] = "You need to have admin privileges to access these pages"
      redirect_to '/'
    end 
  end
end
