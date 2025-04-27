class Training < ApplicationRecord
  belongs_to :user
  has_many :workout_sets

  scope :for_user, ->(user) { where(user_id: user.id) }
end
