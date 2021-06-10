class CreateCartProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_projects do |t|
      t.integer :member_id
      t.integer :project_id
      t.integer :quantity

      t.timestamps
    end
  end
end
