class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update]
  around_action :log_execute_time
  after_action :send_log_message

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def show

  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def search
    result = %W[Class:#{params.class} Parameters:#{params.inspect}]
    render plain: result.join("\n")
  end

  private
  def test_params
    params.require(:tests).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execution time: #{finish*1000}ms")
  end
end
