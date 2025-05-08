class AddBodyPartTable < ActiveRecord::Migration[7.2]
  def change
    create_table :body_parts do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :description
      t.timestamps
    end
  end
end
