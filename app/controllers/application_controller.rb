# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
  
  def check_somebody_logged_in
    unless (user_signed_in? || admin_signed_in?)
      authenticate_user!
    end    
  end
  
  def acsessValidation (notice = 'Sorry but you tried to acsess a private page.', path = root_path)
    flash[:notice] = 'Acsess validation! '+notice
    redirect_to path
  end  
end
