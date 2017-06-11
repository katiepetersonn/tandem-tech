class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @user.comments.new(comment_params)
    @comment.user = @current_user
    @comment.save

    # raise "hell"

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
    params.require(:comment).permit(:user_id, :body)
  end
end
