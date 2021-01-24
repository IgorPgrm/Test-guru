class FeedbackController < ApplicationController

  def index; end

  def send_feedback
    FeedbackMailer.send_feedback(params[:text]).deliver_now
    redirect_to feedback_path, notice: "Success! #{params.inspect}"
  end

  private

  def feedback_params
    params.require(:feedback_params).permit(:subject)
  end
end
