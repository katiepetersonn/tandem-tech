class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    # raise hell
    @comment.save

    redirect_to users_path(@user)
  end

  def destroy
    @user = User.find(params[:project_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to users_path(@user)
  end

  private
  def comment_params
    params.require(:comment).permit(:teacher_id, :user_id, :body)
  end
end
