class Public::FollowsController < ApplicationController
  def index
    user = current_user
    @following_users = user.following_users.page(params[:page]).per(20)
    if  user_signed_in?
      unless @play_history.user_id == current_user.id
        redirect_to play_histore_path(@play_history.id)
      end
    else
      redirect_to play_histores_path
    end
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