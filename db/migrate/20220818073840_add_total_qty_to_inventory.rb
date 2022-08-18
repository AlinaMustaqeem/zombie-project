class AddTotalQtyToInventory < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :total_qty, :integer
  end
end
