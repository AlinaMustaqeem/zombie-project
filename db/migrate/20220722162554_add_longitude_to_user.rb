class AddLongitudeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :longitude, :integer
  end
end
