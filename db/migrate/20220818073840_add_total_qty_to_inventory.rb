# frozen_string_literal: true

class AddTotalQtyToInventory < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :total_qty, :string
  end
end
