# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :category_titles, -> {select(:title).order(:asc)}
end
