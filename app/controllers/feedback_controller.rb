class FeedbackController < ApplicationController

  def index; end

  def feedback_send
    FeedbackMailer.with(params).send_feedback_email.deliver_now
    redirect_to feedback_path, notice: "Success! #{params.inspect}"
  end

  private

  def feedback_params
    params.require(:feedback_params).permit(:subject, :text)
  end
end
