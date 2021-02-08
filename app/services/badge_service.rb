class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @user_test_passages = TestPassage.where(user: @user)
    @received_badges  = []
  end

  def call
    Achievement.all.each do |a|
      @achievement = a
      identity = a.identity
      value = a.value
      result = send(identity, value)
      issue_badge(a) if result
    end
    @received_badges.map{|rb| rb.achievement.name}.join(', ')
  end

  def category_all(category_name)
    return false if @test_passage.test.category.title != category_name || user_does_not_have_this_badge

    all_tests_ids_with_category = Test.show_by_category(category_name).order(id: :asc).pluck(:id)
    user_passed_tp = @user_test_passages.distinct.where(test_id: all_tests_ids_with_category,
                                               result: true).order(test_id: :asc).pluck(:test_id)
    all_tests_ids_with_category == user_passed_tp
  end

  def level_all(lvl)
    return false if @test_passage.test.level == lvl || !user_does_not_have_this_badge

    all_test_ids_with_lvl = Test.where(level: lvl).order(id: :asc).pluck(:id)
    user_passed_tp = @user_test_passages.distinct.where(test_id: all_test_ids_with_lvl,
                                               result: true).order(test_id: :asc).pluck(:test_id)
    all_test_ids_with_lvl == user_passed_tp
  end

  def first_try(empty)
    @user_test_passages.where(test_id: @test_passage.test.id).count == 1
  end

  def issue_badge(achievement)
    badge = Badge.new(achievement: achievement, test_passage: @test_passage)
    @received_badges.push(badge)
    @user.badges.push(badge) ? badge : false
  end

  def user_does_not_have_this_badge
    @user.badges.where(achievement: @achievement).present?
  end
end
