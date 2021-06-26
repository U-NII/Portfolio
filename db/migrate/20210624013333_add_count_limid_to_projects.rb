class AddCountLimidToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :count_limid, :integer
  end
end
