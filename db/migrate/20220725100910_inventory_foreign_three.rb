class InventoryForeignThree < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventories, :user, foreign_key: true
  end
end
