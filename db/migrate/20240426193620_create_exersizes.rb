class CreateExersizes < ActiveRecord::Migration[7.0]
  def change
    create_table :exersizes do |t|
      t.string :name
      t.string :body_part
      t.string :type

      t.timestamps
    end
  end
end
