module TestPassagesHelper
  def question_counter
    total_question_ids = @test_passage.test.questions.ids
    " Total: #{@test_passage.current_question_number} / #{total_question_ids.count}"
  end
end
