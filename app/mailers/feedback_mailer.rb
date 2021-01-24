class FeedbackMailer < ApplicationMailer
  def send_feedback_email
    @subject = params[:subject]
    @text = params[:text]
    mail(to: "Shumeikoigor@yandex.ru", subject: "#{@subject} #{@text}", cc: "system@testguru.com")
  end
end
