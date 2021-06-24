class AddEndTimeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :end_time, :date
  end
end
