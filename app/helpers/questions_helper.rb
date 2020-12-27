module QuestionsHelper
  def question_header(question)
    title = question.persisted? ? t('Edit') : t('Create')
    "#{title} #{@question.test.title} #{t('Question')}"
  end
end
