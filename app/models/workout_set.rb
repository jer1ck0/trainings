class WorkoutSet < ApplicationRecord
    belongs_to :training
    belongs_to :exersize
end
