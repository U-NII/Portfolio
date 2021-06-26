class AddEntrysOptionToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :entrys_option, :integer
  end
end
