class Public::CommentsController < ApplicationController

  def create
    recruit = Recruit.find(params[:recruit_id])
    comment = current_user.comments.new(comment_params)
    comment.recruit_id = recruit.id
    if comment.save
      redirect_to recruit_path(recruit)
    else
      render :show
    end
  end

  def update

  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recruit_path(params[:recruit_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
