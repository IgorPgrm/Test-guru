class FeedbackMailer < ApplicationMailer
  def send_feedback_email(subject, text, sent_at = Time.now)
    @subject = subject
    @text = text
    @sent_at = sent_at
    mail to: "Shumeikoigor@yandex.ru", from: "ecececep@gmail.com"
  end
end
