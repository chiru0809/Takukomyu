class Public::PlayHistoresController < ApplicationController
  def index
    if params[:search] == nil
      @play_histores = PlayHistory.all
    elsif params[:search] == ''
      @play_histores = PlayHistory.all
    else
      @play_histores = PlayHistory.where("scenario_name LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
　　　　　　　#検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
　　　　　　　　#検索されたタグに紐づく投稿を表示
    @posts=@tag.posts.page(params[:page]).per(10)
  end

  def new
    @play_history = PlayHistory.new
  end

  def create
    @play_history = PlayHistory.new(play_history_params)
    @play_history.user_id = current_user.id
    if @play_history.save
      redirect_to play_histore_path(@play_history.id)
    else
      render :new
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
      redirect_to play_histore_path(@play_history.id)
    else
      render :edit
    end
  end

  def destroy
    @play_history = PlayHistory.find(params[:id])
    @play_history.destroy
    redirect_to play_histores_path
  end

  private

  def play_history_params
    params.require(:play_history).permit(:title_id, :scenario_name, :play_style, :memo, :secret_memo, :is_active, :status)
  end
end
