class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.timestamps
    end
    
    add_reference :trainings, :trainer, references: :users, index: true
    add_foreign_key :trainings, :users, column: :trainer_id

    add_reference :trainings, :trainee, references: :users, index: true
    add_foreign_key :trainings, :users, column: :trainee_id
  end
end
