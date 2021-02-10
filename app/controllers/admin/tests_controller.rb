
class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy start update_inline]
  before_action :set_tests, only: %i[update_inline index]

  def index; end

  def new
    @test = Test.new
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, notice: "#{@test.title} Успешно удалён"
    else
      redirect_to admin_tests_path, alert: "Во время удаления произошла ошибка"
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def show; end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  private

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
