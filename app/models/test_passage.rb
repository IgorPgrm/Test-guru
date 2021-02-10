class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :badges, dependent: :nullify

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question
  before_save :set_passed_test, if: :success?

  SUCCESS_PERCENT = 85.freeze

  def accept!(answer_ids)
    if correct_answers.count > 0 && correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def percent
    ( self.correct_questions.to_f / self.test.questions.count.to_f ) * 100
  end

  def current_question_number
    self.test.questions.count - self.remainder_question_count(self.current_question)
  end

  def success?
   self.percent >= SUCCESS_PERCENT
  end

  def remainder_question_count(question)
    self.test.questions.where('id > ?', question.id).count
  end

  def test_end_time
    self.created_at + (self.test.time.minutes)
  end

  def time_is_over?
    return false if self.test.time.zero?

    Time.now > test_end_time
  end

  def redirect_delay
    (test_end_time - Time.now).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct_answer
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_next_question
    self.current_question = next_question
  end

  def set_passed_test
    self.result = true
  end
end
