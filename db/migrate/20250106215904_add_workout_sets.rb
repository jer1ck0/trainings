class AddWorkoutSets < ActiveRecord::Migration[7.2]
  def change
    create_table :workout_sets do |t|
      t.string :comment 
      t.references :training,         null: false
      t.references :exersize,         null: false
      t.integer :sets,                null: false
      t.integer :reps,                null: false

      t.timestamps
    end
  end
end
