class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @achievements = Achievement.all
  end

  def call
    @achievements.each do |a|
      identity = a.identity
      value = a.value
      if send identity, value
        issue_badge(a)
      else
        false
      end
    end
  end

  def category_all(category_name)
    return nil
  end

  def level_all(lvl)
    return nil
  end

  def first_try(empty)
    TestPassage.where(user_id: @user.id, test_id: @test.id).count == 1
  end

  def issue_badge(achievement)
    badge = Badge.new(achievement: achievement, test_passage: @test_passage)
    @user.badges.push(badge) ? badge : false
  end
end
