module GistsHelper
  def question_body_formatter(question)
    question.body.split(" ").first(25).join(" ")
  end
end
