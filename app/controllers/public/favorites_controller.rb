class Public::FavoritesController < ApplicationController
  def create
    play_history = PlayHistory.find(params[:play_histore_id])
    favorite = current_user.favorites.new(play_history_id: play_history.id)
    favorite.save
    redirect_to play_histore_path(play_history)
  end
  
  def destroy
    play_history = PlayHistory.find(params[:play_histore_id])
    favorite = current_user.favorites.find_by(play_history_id: play_history.id)
    favorite.destroy
    redirect_to play_histore_path(play_history)
  end
end
