class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  def index
    @questions = Question.all
  end

  def new
  end

  def show

  end

  def create
    @question = Question.create(quest_params)
    redirect_to quest_params
    #render plain: question.inspect
  end

  def update
  end

  def destroy
  end

  private

  def quest_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
