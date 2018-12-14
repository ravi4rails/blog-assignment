class CommentFeedbacksController < ApplicationController 

  before_action :authenticate_user!

  def new
    @comment = Comment.find(params[:comment_id])
    @user = User.find(params[:user_id])
    @comment_feedback = CommentFeedback.new
  end

  def create
    @comment_feedback = CommentFeedback.new(comment_feedback_params)
    if@comment_feedback.save
      redirect_to request.referrer, flash: { success: "Feedback has been posted successfully" }
    end
  end

  def destroy
    @comment_feedback = CommentFeedback.find(params[:id])
  end

  private 

    def comment_feedback_params
      params.require(:comment_feedback).permit!
    end

end
