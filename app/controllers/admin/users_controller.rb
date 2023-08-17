class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @play_histores = PlayHistory.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
