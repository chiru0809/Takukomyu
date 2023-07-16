class Public::PlayHistoresController < ApplicationController
  def index
    @play_histores = PlayHistory.all
  end
  
  def new
    @play_history = PlayHistory.new
    @title = Title.all
  end
  
  def create
    @play_history = PlayHistory.new(play_history_params)
    @play_history.user_id = current_user.id
    if @play_history.save
      redirect_to play_history_path(@play_history.id)
    else
      render :new
    end
  end

  def show
    @play_history = PlayHistory.params([:id])
  end

  def edit
    @play_history = PlayHistory.params([:id])
  end
  
  private
  
  def play_history_params
    params.require(:play_history).permit(:title_id, :scenario_name, :play_style, :memo, :secret_memo, :is_active)
  end
end
