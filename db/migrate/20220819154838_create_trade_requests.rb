# frozen_string_literal: true

class CreateTradeRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_requests do |t|
      t.bigint :coming_request_id, foreign_key: true
      t.bigint :current_reciever_id, foreign_key: true

      t.timestamps
    end
  end
end
