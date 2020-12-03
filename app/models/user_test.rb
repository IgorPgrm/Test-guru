class UserTest < ApplicationRecord
  has_many :tests
  has_many :users
end
