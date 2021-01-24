class FeedbackMailer < ApplicationMailer
  def send_feedback_email(subject, text, sent_at = Time.now)
    @subject = subject
    @sent_on = sent_at
    @text = text
    @headers = {content_type: 'text/html'}
  end
end
