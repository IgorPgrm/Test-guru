class FeedbackMailer < ApplicationMailer
  def send_feedback(subject)
    mail(to: "Shumeikoigor@yandex.ru", subject: subject, cc: "system@testguru.com")
  end
end
