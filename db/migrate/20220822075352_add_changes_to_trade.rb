class AddChangesToTrade < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :waterc, :integer
    add_column :trades, :watere, :integer
    add_column :trades, :pouchc, :integer
    add_column :trades, :pouche, :integer
    add_column :trades, :soupc, :integer
    add_column :trades, :soupe, :integer
    add_column :trades, :ak47c, :integer
    add_column :trades, :ak47e, :integer
    add_column :trades, :request_status, :integer , default: 0
  end
end
