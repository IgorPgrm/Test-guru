module TestPassagesHelper
  def question_counter
    total_question_ids = @test_passage.test.questions.ids
    "#{t('test_passages.show.total')} #{@test_passage.current_question_number} / #{total_question_ids.count}"
  end

  def question_percent_now
    (@test_passage.current_question_number.to_f / @test_passage.test.questions.ids.count.to_f) * 100
  end

  def timer_format
    @test_passage.test_end_time.strftime("%FT%T")
  end
end
