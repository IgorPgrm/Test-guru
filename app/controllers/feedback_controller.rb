class FeedbackController < ApplicationController

  def index; end

  def feedback
    subject = params[:subject]
    text = params[:text]
    FeedbackMailer.send_feedback_email(subject, text).deliver_now
    redirect_to feedback_path, notice: "Success!"
  end

  private

  def feedback_params
    params.require(:feedback_params).permit(:subject, :text)
  end
end
