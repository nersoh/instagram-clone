class RelationshipsController < ApplicationController
  def create
  	@user = User.find(params[:followed_id])
  	if current_user.follow(@user)
  		flash[:success] = "You have started following #{@user.username}"
  		redirect_to current_user
  	end
  end

  def destroy
  	@user = User.find(params[:followed_id])
  	if current_user.unfollow(@user)
  		flash[:info] = "You've unfollowed #{@user.username}"
  		redirect_to current_user
  	end
  end
end
