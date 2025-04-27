class Api::V1::WorkoutSetSerializer < ActiveModel::Serializer
  attributes :id
  attribute :created_at
  attribute :sets
  attribute :reps
  attribute :comment
  attribute :exersize_name do
    object.exersize.name
  end
end
