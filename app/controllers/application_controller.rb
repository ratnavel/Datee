class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  helper :all # include all helpers, all the time
  
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    session[:original_uri] = nil
    case resource_or_scope
      when :user, User
      if current_user && current_user.is_admin
         "/admin"
      elsif current_user
         "/dashboard"  
      else 
         "/"
      end
    else  
      
    end
  end
  
end
