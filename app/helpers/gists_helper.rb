module GistsHelper
  def question_body_formatter(question)
    question.body.truncate(25)
  end
end
