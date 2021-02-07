class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @user_test_passages = TestPassage.where(user: @user)
    @achievements = Achievement.all
  end

  def call
    @achievements.each do |a|
      @achievement = a
      identity = a.identity
      value = a.value
      result = send identity, value
      if result
        issue_badge(a)
      else
        false
      end
    end
  end

  def category_all(category_name)
    return false unless @test_passage.test.category.title == category_name ||
      @user.badges.where(achievement: @achievement).count.nil?

    all_tests_ids_with_category = Test.show_by_category(category_name).pluck(:id).sort
    user_passed_tp = @user_test_passages.where(test_id: all_tests_ids_with_category).pluck(:test_id).sort
    all_tests_ids_with_category == user_passed_tp
  end

  def level_all(lvl)
    return nil
  end

  def first_try(empty)
    @user_test_passages.where(test_id: @test.id).count == 1 && @test_passage.success?
  end

  def issue_badge(achievement)
    badge = Badge.new(achievement: achievement, test_passage: @test_passage)
    @user.badges.push(badge) ? badge : false
  end
end
