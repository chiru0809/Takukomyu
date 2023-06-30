class Public::UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
    if params[:search] == nil
      @users= User.all
    elsif params[:search] == ''
      @users= User.all
    else
      @users = User.where("name LIKE ? ",'%' + params[:search] + '%')
    end
  end


  def show
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :title_id, :main_playstyle, :is_private)
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
