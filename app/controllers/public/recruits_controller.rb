class Public::RecruitsController < ApplicationController
  def index
    @recruits = Recruit.all
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
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      redirect_to recruit_path(@recruit.id)
    else
      render :edit
    end
  end

  private

  def recruit_params
    params.require(:recruit).permit(:title_id, :scenario_name, :message, :recruit_status)
  end
end
