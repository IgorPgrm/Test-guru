
class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def show; end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
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
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
