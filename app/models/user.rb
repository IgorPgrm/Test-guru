# frozen_string_literal: true
require 'digest/sha1'

class User < ApplicationRecord

  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def list_of_tests(level = 0)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
