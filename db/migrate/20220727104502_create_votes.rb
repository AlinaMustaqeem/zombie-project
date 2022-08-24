# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.bigint :vote_sent_id, foreign_key: true, index: true
      t.bigint :vote_reciever_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
