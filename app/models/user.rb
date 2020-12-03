class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def list_of_tests(level = 0)
    Test.joins(:user_tests).where("user_id = ? and level= ?", self.id, level)
  end
end
