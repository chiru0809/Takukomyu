class Public::FollowsController < ApplicationController
  def index
    user = current_user
    @following_users = user.following_users.page(params[:page]).per(20)
  end

  def create
    current_user.follow(params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
end