module TestPassagesHelper
  def question_counter
    total_question_ids = @test_passage.test.questions.ids
    "#{t('test_passages.show.total')} #{@test_passage.current_question_number} / #{total_question_ids.count}"
  end
end
