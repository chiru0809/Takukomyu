class Admin::RecruitsController < ApplicationController
  def index
    if params[:search] == nil
      @recruits = Recruit.all
    elsif params[:search] == ''
      @recruits = Recruit.all
    else
      @search_title = params[:search]
      @recruits = Recruit.where(title_id: @search_title )
    end
  end

  def show
    @recruit = Recruit.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      redirect_to admin_recruit_path(@recruit.id)
    else
      render :edit
    end
  end

  def destroy
    recruit = Recruit.find(params[:id])
    recruit.destroy
    redirect_to admin_recruits_path(params[:recruit_id])
  end

  private

  def recruit_params
    params.require(:recruit).permit(:title_id, :scenario_name, :message, :recruit_status, :status)
  end
end
