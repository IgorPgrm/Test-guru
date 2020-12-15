class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[create index new]

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def show

  end

  def create
    @questions = @test.questions.new(quest_params)
    if @questions.save
      redirect_to @questions.test
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @question.destroy
    redirect_to tests_path
  end

  private

  def quest_params
    params.require(:questions).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

end
