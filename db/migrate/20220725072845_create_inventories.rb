class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :water, default: 0, null: false
      t.integer :soup, default: 0, null: false
      t.integer :pouch, default: 0, null: false
      t.integer :Ak47, default: 0, null: false

      t.timestamps
    end
  end
end
