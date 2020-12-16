class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[create index new]

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def show

  end

  def edit

  end

  def create
    @question = @test.questions.new(quest_params)
    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def update
    if @question.update(quest_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to tests_path
  end

  private

  def quest_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

end
