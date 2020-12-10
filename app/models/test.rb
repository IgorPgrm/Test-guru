# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: {scope: :level}

  scope :simple_tests, -> { where(level: 0..1 ) }
  scope :middle_tests, -> { where(level: 2..4 ) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  scope :show_by_category, -> (category){ joins(:category).where('categories.title = ?', category)}

  private

  def self.show_sort_category(category)
    show_by_category(category).order('tests.title DESC').pluck(:title)
  end
end
