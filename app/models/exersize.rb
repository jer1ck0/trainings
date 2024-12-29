class Exersize < ApplicationRecord
  BODY_PART = [:legs, :arms, :body, :back, :chest, :abs].freeze
  TYPE = [:pull, :push, :static].freeze
  SUPPORT_TYPE = [:machine, :free_weight, :self_weight].freeze
end
