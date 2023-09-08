class Public::CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @recruit = Recruit.find(params[:recruit_id])
    comment = current_user.comments.new(comment_params)
    comment.recruit_id = @recruit.id
    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to recruit_path(@recruit)
    else
      flash[:alert] = "コメントは1文字以上入力してください"
      render template: "public/recruits/show"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    @comment = Comment.new
    flash[:notice] = "コメントを削除しました"
    redirect_to recruit_path(params[:recruit_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
