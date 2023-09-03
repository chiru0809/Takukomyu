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
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.user_id = current_user.id
    @recruit.recruit_status = true
    if @recruit.save
      redirect_to recruit_path(@recruit.id)
    else
      render :new
    end
  end

  def show
    @recruit = Recruit.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recruit = Recruit.find(params[:id])
    unless @recruit.user_id == current_user.id
      redirect_to recruit_path(@recruit.id)
    end
  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      redirect_to recruit_path(@recruit.id)
    else
      render :edit
    end
  end

  def destroy
    recruit = Recruit.find(params[:id])
    recruit.destroy
    redirect_to recruits_path(params[:recruit_id])
  end

  private

  def recruit_params
    params.require(:recruit).permit(:title_id, :scenario_name, :message, :recruit_status, :status)
  end
end
