class Public::RecruitsController < ApplicationController
  def index
    if params[:search] == nil
      @recruits = Recruit.published.page(params[:page]).per(20)
    elsif params[:search] == ''
      @recruits = Recruit.published.page(params[:page]).per(20)
    else
      @search_title = params[:search]
      @recruits = Recruit.published.where(title_id: @search_title).page(params[:page]).per(20)
    end
  end

  def drafts
    @recruits = current_user.recruits.draft
  end

  def new
    @recruit = Recruit.new
    unless user_signed_in?
      redirect_to play_histores_path
    end
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.user_id = current_user.id
    @recruit.recruit_status = true
    if @recruit.save
      redirect_to recruit_path(@recruit.id), notice: "登録しました。"
    else
      flash.now[:alert] = "シナリオ名とメッセージを入力してください。"
      render :new
    end
  end

  def show
    @recruit = Recruit.find(params[:id])
    @comment = Comment.new
    if  user_signed_in?
      if @recruit.user_id != current_user.id && @recruit.status != "published"
        redirect_to recruits_path
      end
    else
      if @recruit.status != "published"
        redirect_to recruits_path
      end
    end
  end

  def edit
    @recruit = Recruit.find(params[:id])
    if  user_signed_in?
      unless @recruit.user_id == current_user.id
        redirect_to recruit_path(@recruit.id)
      end
    else
      redirect_to recruits_path
    end

  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      flash[:notice] = "更新しました。"
      redirect_to recruit_path(@recruit.id)
    else
      flash.now[:alert] = "シナリオ名とメッセージを入力してください"
      render :edit
    end
  end

  def destroy
    recruit = Recruit.find(params[:id])
    recruit.destroy
    flash[:notice] = "削除しました。"
    redirect_to recruits_pat
  end

  private

  def recruit_params
    params.require(:recruit).permit(:title_id, :scenario_name, :message, :recruit_status, :status)
  end
end
