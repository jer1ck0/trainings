class CreateWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sets do |t|
      t.references :exersize, foreign_key: true
      t.references :training, foreign_key: true
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end
