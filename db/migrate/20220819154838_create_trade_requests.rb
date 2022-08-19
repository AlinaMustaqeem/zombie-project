class CreateTradeRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_requests do |t|

      t.timestamps
    end
  end
end
