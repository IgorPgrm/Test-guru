class Achievement < ApplicationRecord
  enum identity: %w(empty first_try category_all level_all)
  has_many :badges
  has_many :users, through: :badges
end
