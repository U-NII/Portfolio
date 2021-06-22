class AddExpiredAtToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :expired_at, :date
  end
end
