# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :validatable

  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :badges, dependent: :destroy
  has_many :achievements, through: :badges

  def list_of_tests(level = 0)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def is_admin?
    self.is_a?(Admin)
  end
end
