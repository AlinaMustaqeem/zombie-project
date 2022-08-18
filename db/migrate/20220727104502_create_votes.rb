class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.bigint :vote_sent_id, foreign_key:true
      t.bigint :vote_reciever_id,foreign_key:true

      t.timestamps
    end
  end
end
