class Admin::PlayHistoresController < ApplicationController
  def index
    if params[:search] == nil
      @play_histores = PlayHistory.all
    elsif params[:search] == ''
      @play_histores = PlayHistory.all
    else
      @play_histores = PlayHistory.where("scenario_name LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def show
    @user = PlayHistory.find(params[:id])
    @play_history = PlayHistory.find(params[:id])
  end

  def edit
    @play_history = PlayHistory.find(params[:id])
  end

  def update
    @play_history = PlayHistory.find(params[:id])
    if @play_history.update(play_history_params)
      redirect_to admin_play_histore_path(@play_history.id)
    else
      render :edit
    end
  end

  def destroy
    @play_history = PlayHistory.find(params[:id])
    @play_history.destroy
    redirect_to admin_play_histores_path
  end

  private

  def play_history_params
    params.require(:play_history).permit(:title_id, :scenario_name, :play_style, :memo, :secret_memo, :is_active)
  end
end