class AddExersizes < ActiveRecord::Migration[7.2]
  def change
    create_table :exersizes do |t|
      t.string :comment 
      t.boolean :countable,         default: true
      t.string :body_part,         null: false
      t.references :user

      t.timestamps
    end
  end
end
