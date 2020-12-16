module QuestionsHelper
  def question_header
    if action_name == 'new'
      @title = 'Create New'
    else
      @title = 'Edit'
    end
    "#{@title} #{@question.test.title} Question"
  end
end
