class Admin::TitlesController < ApplicationController
  def index
    @titles = Title.all
    @title = Title.new
  end
  
  def create
    @titles = Title.all
    @title = Title.new(title_params)
    if @title.save
      redirect_to admin_titles_path
    else
      render :index
    end
  end

  def edit
    @title = Title.find(params[:id])
  end
  
  
  def update
    @title = Title.find(params[:id])
    if @title.update(title_params)
      redirect_to admin_titles_path
    else
      render :index
    end
  end
  
  def destroy
    title = Title.find(params[:id])
    title.destroy
    redirect_to admin_titles_path
  end
  
  private
  
  def title_params
    params.require(:title).permit(:name)
  end
end
