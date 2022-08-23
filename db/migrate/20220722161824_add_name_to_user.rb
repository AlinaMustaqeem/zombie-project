# frozen_string_literal: true

class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
  end
end
