class Training < ApplicationRecord
  belongs_to :trainer, class_name: 'User'
  belongs_to :trainee, class_name: 'User'

  has_many :workout_sets

  scope :for_current_user, ->(user) { where(trainee_id: user.id) }
end
