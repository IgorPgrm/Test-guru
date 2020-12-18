# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true

  scope :correct_answer, -> { where(correct: true)}
  scope :correct_answer_for_question, -> (quest_ids) { joins(:question).where(question_id: quest_ids).where(correct: true)}
end
