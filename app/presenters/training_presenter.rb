class TrainingPresenter < SimpleDelegator
  include ApplicationHelper
  include ActionView::Helpers::DateHelper

  def model
    __getobj__
  end
end