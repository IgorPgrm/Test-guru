class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def index
    @questions = Question.all
  end

  def new
    @question = Question.create(test_id: params[:test_id])
  end

  def show

  end

  def create
    @question = Question.create(quest_params)
    @question.save!
    redirect_to question_path(@question.id)
    #render plain: question.inspect
  end

  def update
  end

  def destroy
    @question.destroy
    redirect_to tests_path
  end

  private

  def quest_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_question
    @question = Question.find(params[:id])
  end

end
