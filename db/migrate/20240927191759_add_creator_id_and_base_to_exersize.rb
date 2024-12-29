class AddCreatorIdAndBaseToExersize < ActiveRecord::Migration[7.2]
  def change
    add_column :exersizes, :base, :boolean
    add_column :exersizes, :creator_id, :integer
    add_column :exersizes, :base_exersize_id, :integer
    add_column :exersizes, :support_type, :string
  end
end
