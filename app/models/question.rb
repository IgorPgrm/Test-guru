# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :nullify

  validates :body, presence: true
  validate :answers_counter, on: :create

  def self.remainder_question_count(question)
    question.test.questions.where('id > ?', question.id).count
  end

  private

  def answers_counter
    errors.add(:count, message: 'Should be from 1 to 4 answers') if answers.count > 4
  end
end
