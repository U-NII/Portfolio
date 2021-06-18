class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :member_id
      t.integer :shipping_cost
      t.integer :pay_type, default: 0
      t.integer :total_price
      t.string :name
      t.integer :buy_status, default: 0
      t.string :telephone_number

      t.timestamps
    end
  end
end
