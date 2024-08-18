class AddMissionTypeToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :mission_type, :string
  end
end
