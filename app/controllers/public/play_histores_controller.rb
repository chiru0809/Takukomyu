class Public::PlayHistoresController < ApplicationController
  def index
    if params[:search] == nil
      @play_histores = PlayHistory.where(is_active: true).all.page(params[:page]).per(20)
    elsif params[:search] == ''
      @play_histores = PlayHistory.where(is_active: true).all.page(params[:page]).per(20)
    else
      @play_histores = PlayHistory.where(is_active: true).where("scenario_name LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(20)
    end
  end

  def new
    @play_history = PlayHistory.new
    unless user_signed_in?
      redirect_to play_histores_path
    end
  end

  def create
    @play_history = PlayHistory.new(play_history_params)
    @play_history.user_id = current_user.id
    if @play_history.save
      redirect_to play_histore_path(@play_history.id), notice: "登録しました"
    else
      flash.now[:alert] = "シナリオ名を入力してください"
      render :new
    end
  end

  def show
    @user = PlayHistory.find(params[:id])
    @play_history = PlayHistory.find(params[:id])
  end

  def edit
    @play_history = PlayHistory.find(params[:id])
    if  user_signed_in?
      unless @play_history.user_id == current_user.id
        redirect_to play_histore_path(@play_history.id)
      end
    else
      redirect_to play_histores_path
    end
  end

  def update
    @play_history = PlayHistory.find(params[:id])
    if @play_history.update(play_history_params)
      flash[:notice] = "更新しました。"
      redirect_to play_histore_path(@play_history.id)
    else
      flash.now[:alert] = "シナリオ名を入力してください。"
      render :edit
    end
  end

  def destroy
    @play_history = PlayHistory.find(params[:id])
    @play_history.destroy
    flash[:notice] = "削除しました。"
    redirect_to play_histores_path
  end

  private

  def play_history_params
    params.require(:play_history).permit(:title_id, :scenario_name, :play_style, :memo, :secret_memo, :is_active, :status)
  end
end
