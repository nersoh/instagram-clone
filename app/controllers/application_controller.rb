class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	
	include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
	before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :username
  	devise_parameter_sanitizer.for(:account_update) << :username	
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
