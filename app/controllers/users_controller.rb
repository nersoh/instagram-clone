class UsersController < ApplicationController
  def index
  	@users = User.where.not(id: current_user.id)
  end

  def show
  	@user = User.find(params[:id])
  end

  def following
  	@page = "Following"
  	@user = User.find(params[:id])
  	@users = @user.following
  	render 'show_following_followers'
  end

  def followers
  	@page = "Followers"
  	@user = User.find(params[:id])
  	@users = @user.followers
  	render 'show_following_followers'
  end
end
