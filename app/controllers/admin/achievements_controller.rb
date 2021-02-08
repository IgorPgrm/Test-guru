class Admin::AchievementsController < ActionController::Base
  layout "admin"
  before_action :find_achievement, only: %i[edit update destroy]
  before_action :available_image, only: %i[new create edit update]

  def index
    @achievements = Achievement.all
  end

  def new
    @achievement = Achievement.new
  end

  def edit; end

  def update
    if @achievement.update(achievement_params)
      redirect_to admin_achievements_path, notice: "Success"
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_achievements_path, notice: @achievement.destroy ? "Success" : "Failed"
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to admin_achievements_path, notice: "Успешно"
    else
      render :new
    end
  end

  private

  def achievement_params
    params.require(:achievement).permit(:name, :file_name, :identity, :value, :category_id)
  end

  def find_achievement
    @achievement = Achievement.find(params[:id])
  end

  def available_image
    @images = Dir.glob("./app/assets/images/achievements/*.png").select { |e| File.file? e }
    @images.map! {|f| f.split("/").last}
  end
end
