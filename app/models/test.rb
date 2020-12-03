class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category

  def self.show_by_category(category)
    Test.joins(:category).where("categories.title = ?", category).order("tests.title DESC")
  end
end
