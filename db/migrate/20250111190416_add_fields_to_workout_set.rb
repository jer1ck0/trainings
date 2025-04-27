class AddFieldsToWorkoutSet < ActiveRecord::Migration[7.2]
  def change
    add_column :workout_sets, :sets, :integer
    add_column :workout_sets, :reps, :integer
  end
end
