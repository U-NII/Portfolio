class AddAddressToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :address, :string
  end
end
