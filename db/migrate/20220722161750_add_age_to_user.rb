# frozen_string_literal: true

class AddAgeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer , null: false
  end
end
