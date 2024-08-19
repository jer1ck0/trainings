class AddCommentToTraining < ActiveRecord::Migration[7.1]
  def change
    add_column :trainings, :comment, :text
  end
end
