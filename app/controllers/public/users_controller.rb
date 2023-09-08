class Public::UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    if params[:search] == nil
      @users= User.where(is_private: false).page(params[:page]).per(20)
    elsif params[:search] == ''
      @users= User.where(is_private: false).page(params[:page]).per(20)
    else
      @users = User.where(is_private: false).where("name LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(20)
    end
  end

  def show
    @play_histores = PlayHistory.where(user_id: params[:id]).page(params[:page]).per(10)
    @user_play_histores = PlayHistory.where(user_id: params[:id]).where(is_active: true).page(params[:page]).per(10)
    @user = User.find(params[:id])
    if  user_signed_in?
      if @user.id != current_user.id && @user.is_private != false
        redirect_to users_path
      end
    else
      if @user.is_private != false
        redirect_to users_path
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    if  user_signed_in?
      if @user.id != current_user.id || @user.email == 'guest@example.com'
        redirect_to user_path(@user.id)
      end
    else
      redirect_to users_path
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "必須項目を入力してください。"
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "アカウントを削除しました。"
    redirect_to top_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :title_id, :main_playstyle, :is_private, :profile_image, :is_deleted, :message)
  end
end