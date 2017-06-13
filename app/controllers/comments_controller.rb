class CommentsController < ApplicationController

  def create
    @user = User.find(params[:project_id])
    @comment = @user.comments.new(comment_params)
    @comment.student_id = @current_user.id
    @comment.save

    redirect_to project_path(@project)
  end

  def destroy
    @user = User.find(params[:project_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to users_path(@user)
  end

  private
  def comment_params
    params.require(:comment).permit(:teacher_id, :student_id, :body)
  end
end
