# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :answers_counter

  private

  def answers_counter
    errors.add(:count, message: 'Should be from 1 to 4 answers') if self.answers.count > 4
  end
end
