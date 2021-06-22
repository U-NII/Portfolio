class CreateReceiveds < ActiveRecord::Migration[5.2]
  def change
    create_table :receiveds do |t|
      t.integer :member_id
      t.string :name
      t.string :telephone_number, null: false
      
      t.timestamps
    end
  end
end
