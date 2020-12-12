class TestsController < ApplicationController
  def index
    render plain: Test.all.inspect
  end

  def new

  end

  def show
    redirect_to root_path
  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  def search
    result = ["Class:#{params.class}", "Parameters:#{params.inspect}"]
    render plain: result.join("\n")
  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
