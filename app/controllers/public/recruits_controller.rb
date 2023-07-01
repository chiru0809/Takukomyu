class Public::RecruitsController < ApplicationController
  def index
    @recruits = Recruit.all
  end

  def new
    @recruit = Recruit.new
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end
end
