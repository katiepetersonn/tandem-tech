class CommentsController < ApplicationController

  def create

    @teacher = User.find_by(id: params['comment']['teacher_id'])
    @comment = Comment.new(comment_params)
    @comment.user_id = @teacher.id
    @comment.save
    
    redirect_to "/users/#{@teacher.id}"
  end

  def destroy
    @user = User.find(params[:id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to users_path(@user)
  end

  private
  def comment_params
    params.require(:comment).permit(:teacher_id, :user_id, :body)
  end
end
