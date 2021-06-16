class AddWithdrawalFlagToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :withdrawal_flag, :boolean
  end
end
