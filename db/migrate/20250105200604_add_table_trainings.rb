class AddTableTrainings < ActiveRecord::Migration[7.2]
  def change
    create_table :trainings do |t|
      t.string :description 
      t.references :user,         null: false

      t.timestamps
    end
  end
end
