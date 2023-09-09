class Admin::CommentsController < ApplicationController

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_recruit_path(params[:recruit_id])
  end

end
