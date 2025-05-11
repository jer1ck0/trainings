class Api::V1::TrainingSerializer < ActiveModel::Serializer
  attributes :id
  attribute :created_at
  attribute :workout_sets do
    object.workout_sets.map { |ws| ::Api::V1::WorkoutSetSerializer.new(ws)}
  end
end
