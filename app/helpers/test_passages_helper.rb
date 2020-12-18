module TestPassagesHelper
  def question_counter
    current_question_number = 0
    total_question_ids = @test_passage.test.questions.ids
    current_question_id = @test_passage.current_question.id
    total_question_ids.each.with_index(1){ |x, index| current_question_number = index if x == current_question_id}
    " Total: #{current_question_number} / #{total_question_ids.count}"
  end
end
