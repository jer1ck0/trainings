class Training < ApplicationRecord
  belongs_to :trainer, class_name: 'User'
  belongs_to :trainee, class_name: 'User'

  has_many :workout_sets
end
