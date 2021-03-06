class RelationshipsController < ApplicationController
  def create
  	@user = User.find(params[:followed_id])
  	if current_user.follow(@user)
  		respond_to do |format|
        format.html { redirect_to current_user }
        format.js
      end
  	end
  end

  def destroy
  	@user = User.find(params[:followed_id])
  	if current_user.unfollow(@user)
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js
      end
  	end
  end
end
