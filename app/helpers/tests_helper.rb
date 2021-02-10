module TestsHelper
  def passed_time(test)
    test.time == 0 ? t('helpers.label.test.no_time') : test.time
  end
end
