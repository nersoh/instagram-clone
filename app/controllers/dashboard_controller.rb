class DashboardController < ApplicationController
	#after_action :verify_authorized
  def index
  	@pictures = current_user.pictures
  	redirect_to new_user_session_url unless user_signed_in?
  end
end
