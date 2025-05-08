class Exersize < ApplicationRecord
  belongs_to :body_part

  scope :for_body_part, ->(body_part_id) { where(body_part_id: body_part_id) }

end
