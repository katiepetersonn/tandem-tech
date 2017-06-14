class CommentsController < ApplicationController

  # def show
  #   @all_comments = Comment.all
  #   @comment = Comment.new
  #   @comment.user_id = @current_user.id
  #   @booking = Booking.find_by(id: params["id"])
  # end

  def create
    @teacher = User.find_by(id: params['comment']['teacher_id'])
    @comment = Comment.new(comment_params)
    @comment.user_id = @teacher.id
    @comment.save
    redirect_to "/users/#{@teacher.id}"
  end

  def destroy
    # raise "hell"

    @comment = Comment.find_by(id: params["id"])
    # raise

    user_id = @comment.user_id

    @comment.destroy
    redirect_to "/users/#{user_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:teacher_id, :user_id, :body)
  end
end
