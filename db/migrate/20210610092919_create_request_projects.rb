class CreateRequestProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :request_projects do |t|
      t.integer :request_id
      t.integer :project_id
      t.integer :quantity
      t.integer :make_status, default: 0
      t.integer :price

      t.timestamps
    end
  end
end
