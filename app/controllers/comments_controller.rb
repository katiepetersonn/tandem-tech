class CommentsController < ApplicationController

  def create
    @item = User.find(params[:item_id])
    @comment = @user.comments.new(comment_params)
    @comment.user = @current_user
    @comment.save

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:item_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_path(@user)

  end

  private
  def comment_params
    params.require(:comment).permit(:teacher_id, :student_id, :body)
  end
end
