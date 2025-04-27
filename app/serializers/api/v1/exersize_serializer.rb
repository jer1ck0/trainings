class Api::V1::ExersizeSerializer < ActiveModel::Serializer
  attributes :id, :name, :comment, :countable, :body_part
end
