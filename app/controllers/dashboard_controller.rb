class DashboardController < ApplicationController
	#after_action :verify_authorized
  def index
  	if user_signed_in?
  		@feed = current_user.feed
  	else
  		redirect_to new_user_session_url unless user_signed_in?
  	end
  end
end
