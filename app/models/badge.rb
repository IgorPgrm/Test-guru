class Badge < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :achievement
  belongs_to :test_passage, dependent: :destroy
end
