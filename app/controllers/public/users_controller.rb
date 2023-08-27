class Public::UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    if params[:search] == nil
      @users= User.where(is_private: false)
    elsif params[:search] == ''
      @users= User.where(is_private: false)
    else
      @users = User.where(is_private: false).where("name LIKE ? ",'%' + params[:search] + '%')
    end
  end


  def show
    @play_histores = PlayHistory.where(user_id: params[:id])
    @user_play_histores = PlayHistory.where(user_id: params[:id]).where(is_active: true)
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :title_id, :main_playstyle, :is_private, :profile_image)
  end

end
