# frozen_string_literal: true

class AddGenderToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :char , default: 'M'
  end
end
