# frozen_string_literal: true

class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.bigint :sending_user_id, foreign_key: true ,index: true
      t.bigint :recieving_user_id, foreign_key: true, index:true

      t.timestamps
    end
  end
end
