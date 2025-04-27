class Exersize < ApplicationRecord
  BODY_PARTS = %i(back chest legs hands cardio base abdominal common)

  scope :for_body_part, ->(body_part) { where(body_part: body_part) }

end
