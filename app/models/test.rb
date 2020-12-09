# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  scope :simple_tests, -> {select_test_by_lvl(0..1)}
  scope :middle_tests, -> {select_test_by_lvl(2..4)}
  scope :hard_tests, -> {select_test_by_lvl(2..Float::INFINITY)}

  def self.show_by_category(category)
    Test.joins(:category).where('categories.title = ?', category).order('tests.title DESC')
  end

  private

  def self.select_test_by_lvl(lvl)
    where(level: lvl)
  end
end
