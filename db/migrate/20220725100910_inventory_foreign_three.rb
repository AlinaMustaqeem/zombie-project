# frozen_string_literal: true

class InventoryForeignThree < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventories, :user, foreign_key: true ,index: true
  end
end
